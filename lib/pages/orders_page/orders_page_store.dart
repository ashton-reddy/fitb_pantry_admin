import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

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

  @action
  Future<void> loadPage() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("Orders").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final order = OrderModel.fromJson(data);
      ordersList.add(
        order,
      );
    }
    isLoading = false;
  }
}