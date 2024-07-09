import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_saver/file_saver.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:fitbadmin/models/student_model/student_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

part 'order_detail_page_store.g.dart';

@injectable
class OrderDetailPageStore = _OrderDetailPageStore with _$OrderDetailPageStore;

abstract class _OrderDetailPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final OrderModel orderModel;
  final DateTime? timestamp;

  _OrderDetailPageStore(this.orderModel, this.timestamp);

  @observable
  bool isLoading = false;

  @observable
  StudentModel? studentModel;

  @observable
  List<ItemModel> itemsList = [];

  moveDocument() async {
    isLoading = true;
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

    isLoading = false;
  }

  @action
  Future<void> loadPage() async {
    isLoading = true;
    final items = orderModel.items;
    for (int i = 0; i < items.length; i++) {
      final coll = firestore.collection("Items");
      final qs = await coll.doc(orderModel.items[i].itemId).get();
      final data = qs.data();
      if (data != null) {
        final itemInstance = ItemModel.fromJson(data);
        itemsList.add(itemInstance);
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

    isLoading = false;
  }

  Future<void> makePdf() async {
    //isLoading = true;
    var myTheme = pw.ThemeData.withFont(
      base:
          Font.ttf(await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
    );
    final pdf = pw.Document(
      theme: myTheme,
    );
    final imageLogo = pw.MemoryImage(
        (await rootBundle.load('assets/logo.png')).buffer.asUint8List());
    pdf.addPage(
      pw.Page(build: (context) {
        return pw.Center(
          child: pw.Column(children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(16.0),
              child: pw.Image(
                imageLogo,
                fit: pw.BoxFit.contain,
                height: 50,
              ),
            ),
            pw.Text(
              '${studentModel!.firstName} ${studentModel!.lastName}',
              textAlign: TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 24,
              ),
            ),
            pw.Text(
              'email: ${studentModel!.email}',
              textAlign: TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 24,
              ),
            ),
            pw.Text(
              'phone number: ${studentModel!.phoneNumber}',
              textAlign: TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 24,
              ),
            ),
            pw.Text(
              'school: ${studentModel!.school}',
              textAlign: TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 24,
              ),
            ),
            pw.SizedBox(height: 32),
            pw.Text(
              'Items: ',
              textAlign: TextAlign.left,
              style: const pw.TextStyle(
                fontSize: 24,
              ),
            ),
            pw.SizedBox(height: 16),
            for (var item in itemsList)
              pw.Text(
                '${item.id} - ${orderModel.items.firstWhere((element) => element.itemId == item.id).quantity}',
                textAlign: TextAlign.left,
                style: const pw.TextStyle(
                  fontSize: 18,
                ),
              ),
          ]),
        );
      }),
    );

    var bytes = await pdf.save();
    await FileSaver.instance.saveFile(
      bytes: bytes,
      name: 'order.pdf',
    );
  }
}
