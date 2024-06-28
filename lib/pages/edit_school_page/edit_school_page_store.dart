import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/school_model/school_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:fitbadmin/pages/add_school_page/add_school_page_store.dart';

part 'edit_school_page_store.g.dart';

@injectable
class EditSchoolPageStore = _EditSchoolPageStore with _$EditSchoolPageStore;

abstract class _EditSchoolPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final SchoolModel school;
  final AddSchoolPageStore addSchoolPageStore;

  _EditSchoolPageStore(this.school, this.addSchoolPageStore);

  @observable
  bool isLoading = false;

  @action
  Future<void> loadPage() async {
    isLoading = true;
    isLoading = false;
  }

  @action
  Future<void> saveSchools(
      String name, int openDate, int closeDate, String email) async {
    await addSchoolPageStore.saveSchools(name, openDate, closeDate, email);
  }
}
