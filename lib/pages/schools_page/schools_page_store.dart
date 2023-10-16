import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/school_model/school_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'schools_page_store.g.dart';

@injectable
class SchoolsPageStore = _SchoolsPageStore with _$SchoolsPageStore;

abstract class _SchoolsPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _SchoolsPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<SchoolModel> schoolsList = ObservableList.of([]);

  @action
  Future<void> loadPage() async {
    isLoading = true;
    schoolsList = ObservableList.of([]);
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("School").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final school = SchoolModel.fromJson(data);
      schoolsList.add(
        school,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> deleteSchool(int index) async {
    isLoading = true;
    await FirebaseFirestore.instance
        .collection('School')
        .doc(schoolsList[index].name)
        .delete();

    schoolsList.removeAt(index);
    isLoading = false;
  }

  @action
  Future<void> deactivateSchool(int index, bool currentStatus) async {
    isLoading = true;
    Map<String, dynamic> newData = {
      'name': schoolsList[index].name,
      'open date': schoolsList[index].openDate,
      'close date': schoolsList[index].closeDate,
      'is active' : !currentStatus,
    };
    await FirebaseFirestore.instance
        .collection('School')
        .doc(schoolsList[index].name)
        .update(newData);
    loadPage();
    isLoading = false;
  }
}
