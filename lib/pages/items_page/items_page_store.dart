import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'items_page_store.g.dart';

@injectable
class ItemsPageStore = _ItemsPageStore with _$ItemsPageStore;

abstract class _ItemsPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _ItemsPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ItemModel> itemsList = ObservableList.of([]);

  @action
  Future<void> loadPage() async {
    isLoading = true;
    itemsList = ObservableList.of([]);
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("Items").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final item = ItemModel.fromJson(data);
      itemsList.add(
        item,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> deleteItem(int index) async {
    isLoading = true;
    await FirebaseFirestore.instance
        .collection('Items')
        .doc(itemsList[index].id)
        .delete();
    itemsList.removeAt(index);
    isLoading = false;
  }
}
