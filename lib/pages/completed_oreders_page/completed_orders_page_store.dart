import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'completed_orders_page_store.g.dart';

@injectable
class CompletedOrdersPageStore = _CompletedOrdersPageStore with _$CompletedOrdersPageStore;

abstract class _CompletedOrdersPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _CompletedOrdersPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<OrderModel> ordersList = ObservableList.of([]);

  @action
  Future<void> loadPage() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("CompletedOrders").get();
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