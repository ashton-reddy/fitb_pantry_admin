import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/category_model/category_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:fitbadmin/pages/add_category_page/add_category_page_store.dart';

part 'edit_category_page_store.g.dart';

@injectable
class EditCategoryPageStore = _EditCategoryPageStore with _$EditCategoryPageStore;

abstract class _EditCategoryPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CategoryModel category;
  final AddCategoryPageStore addCategoryPageStore;

  _EditCategoryPageStore(this.category, this.addCategoryPageStore);

  @observable
  bool isLoading = false;

  @action
  Future<void> loadPage() async {
    isLoading = true;
    isLoading = false;
  }

  @action
  Future<void> saveCategorys(
      String name, int limit) async {
    await addCategoryPageStore.saveCategorys(name, limit);
  }
}