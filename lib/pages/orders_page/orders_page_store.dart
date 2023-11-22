import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_saver/file_saver.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:fitbadmin/models/school_model/school_model.dart';
import 'package:fitbadmin/models/student_model/student_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

part 'orders_page_store.g.dart';

@injectable
class OrdersPageStore = _OrdersPageStore with _$OrdersPageStore;

abstract class _OrdersPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _OrdersPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<OrderModel> ordersList = ObservableList.of([]);

  @observable
  ObservableList<String> schools = ObservableList.of([]);

  @observable
  String selectedSchool = '';

  @action
  Future<void> loadPage() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> schoolsSnapshot =
        await firestore.collection("School").get();
    for (int i = 0; i < schoolsSnapshot.docs.length; i++) {
      final data = schoolsSnapshot.docs[i].data();
      final school = SchoolModel.fromJson(data);
      schools.add(
        school.name,
      );
    }
    selectedSchool = schools.first;

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("Orders").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final order = OrderModel.fromJson(data);
      final coll = firestore.collection("Student");
      final qs = await coll.doc(order.studentId).get();
      final studentData = qs.data();
      if (studentData != null) {
        if (studentData['school'] == selectedSchool) {
          ordersList.add(
            order,
          );
        }
      }
    }

    isLoading = false;
  }

  @action
  reloadPage() async {
    ordersList = ObservableList.of([]);
    schools = ObservableList.of([]);
    selectedSchool = '';
    await loadPage();
  }

  @action
  completeOrders() async {
    isLoading = true;

    for (var orderModel in ordersList) {
      List<Map<String, dynamic>> tempItemList = [];

      for (int i = 0; i < orderModel.items.length; i++) {
        tempItemList.add(orderModel.items[i].toJson());
      }

      Map<String, dynamic> dataToSave = {
        'items': tempItemList,
        'studentId': orderModel.studentId,
      };

      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('CompletedOrders');
      await collectionRef.doc(orderModel.studentId).set(dataToSave);

      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(orderModel.studentId)
          .delete();
    }

    isLoading = false;
    await reloadPage();
  }

  @action
  Future<void> onSchoolChanged(String newSchool) async {
    isLoading = true;
    ordersList = ObservableList.of([]);
    selectedSchool = schools.firstWhere((element) => element == newSchool);

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("Orders").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final order = OrderModel.fromJson(data);
      final coll = firestore.collection("Student");
      final qs = await coll.doc(order.studentId).get();
      final studentData = qs.data();
      if (studentData != null) {
        if (studentData['school'] == selectedSchool) {
          ordersList.add(
            order,
          );
        }
      }
    }
    isLoading = false;
  }

  Future<void> makePdf() async {
    isLoading = true;
    List<pw.Widget> gridTiles = [];
    List itemImages = [];

    for (var orderModel in ordersList) {
      List<ItemModel> itemsList = [];
      StudentModel? studentModel;
      final items = orderModel.items;
      for (int i = 0; i < items.length; i++) {
        final coll = firestore.collection("Items");
        final qs = await coll.doc(orderModel.items[i].itemId).get();
        final data = qs.data();
        if (data != null) {
          final itemInstance = ItemModel.fromJson(data);
          itemsList.add(itemInstance);
          final itemImage = await networkImage(itemInstance.image);
          itemImages.add(itemImage);
        } else {
          final itemInstance = ItemModel(
            label: 'deleted item',
            image: 'assets/no_image.png',
            group: '',
            id: '',
          );
          itemsList.add(itemInstance);
        }
      }

      final coll = firestore.collection("Student");
      final qs = await coll.doc(orderModel.studentId).get();
      final data = qs.data();
      if (data != null) {
        studentModel = StudentModel.fromJson(data);
      }

      gridTiles.add(
        pw.Center(
          child: pw.Container(
            width: double.maxFinite,
            padding: const pw.EdgeInsets.all(16),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(
                width: 1,
                color: PdfColors.black,
              ),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '${studentModel!.firstName} ${studentModel.lastName}',
                  textAlign: TextAlign.left,
                  style: const pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
                pw.SizedBox(
                  height: 16,
                ),
                pw.Text(
                  'email: ${studentModel.email}',
                  textAlign: TextAlign.left,
                ),
                pw.Text(
                  'phone number: ${studentModel.phoneNumber}',
                  textAlign: TextAlign.left,
                ),
                pw.Text(
                  'school: ${studentModel.school}',
                  textAlign: TextAlign.left,
                ),
                pw.Text(
                  'Items: ',
                  textAlign: TextAlign.left,
                ),
                for (int i = 0; i < itemsList.length; i++)
                  pw.Row(children: [
                    pw.Image(
                      itemImages[i],
                      width: 50,
                      height: 50,
                    ),
                    pw.SizedBox(
                      width: 16,
                    ),
                    pw.Text(
                      '${itemsList[i].id} - ${orderModel.items.firstWhere((element) => element.itemId == itemsList[i].id).quantity}',
                      textAlign: TextAlign.left,
                    ),
                  ])
              ],
            ),
          ),
        ),
      );
    }

    var myTheme = pw.ThemeData.withFont(
      base:
          Font.ttf(await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
    );
    final pdf = pw.Document(
      theme: myTheme,
    );
    final imageLogo = pw.MemoryImage(
        (await rootBundle.load('assets/logo.png')).buffer.asUint8List());

    final headerWidget = pw.Column(
      children: [
        pw.Container(
          padding: const pw.EdgeInsets.all(16.0),
          child: pw.Image(
            imageLogo,
            fit: pw.BoxFit.contain,
            height: 50,
          ),
        ),
        pw.Text(
          'Orders from $selectedSchool',
          textAlign: TextAlign.center,
          style: const pw.TextStyle(
            fontSize: 24,
          ),
        ),
        pw.SizedBox(
          height: 16,
        ),
        gridTiles.first,
      ],
    );
    gridTiles[0] = headerWidget;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => gridTiles,
      ),
    );

    var bytes = await pdf.save();
    await FileSaver.instance.saveFile(
      bytes: bytes,
      name: 'orders.pdf',
    );

    isLoading = false;
  }
}
