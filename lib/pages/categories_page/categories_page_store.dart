import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/category_model/category_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'categories_page_store.g.dart';

@injectable
class CategoriesPageStore = _CategoriesPageStore with _$CategoriesPageStore;

abstract class _CategoriesPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _CategoriesPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<CategoryModel> categoriesList = ObservableList.of([]);

  @action
  Future<void> loadPage() async {
    isLoading = true;
    categoriesList = ObservableList.of([]);
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("Groups").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final category = CategoryModel.fromJson(data);
      categoriesList.add(
        category,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> addCategory() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("Groups").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final category = CategoryModel.fromJson(data);
      categoriesList.add(
        category,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> deleteCategory(int index) async {
    isLoading = true;
    await FirebaseFirestore.instance
        .collection('Groups')
        .doc(categoriesList[index].name)
        .delete();

    categoriesList.removeAt(index);
    isLoading = false;
  }
}
