import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:fitbadmin/models/school_model/school_model.dart';
import 'package:fitbadmin/models/student_model/student_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'order_detail_page_store.g.dart';

@injectable
class OrderDetailPageStore = _OrderDetailPageStore with _$OrderDetailPageStore;

abstract class _OrderDetailPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final OrderModel orderModel;

  _OrderDetailPageStore(this.orderModel);

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
}
