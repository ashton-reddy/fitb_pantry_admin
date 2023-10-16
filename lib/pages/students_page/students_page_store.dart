import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/student_model/student_model.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'students_page_store.g.dart';

@injectable
class StudentsPageStore = _StudentsPageStore with _$StudentsPageStore;

abstract class _StudentsPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _StudentsPageStore();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<StudentModel> studentsList = ObservableList.of([]);

  @action
  Future<void> loadPage() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection("Student").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      final data = snapshot.docs[i].data();
      final student = StudentModel.fromJson(data);
      studentsList.add(
        student,
      );
    }
    isLoading = false;
  }

  @action
  Future<void> deleteStudents(int index) async {
    isLoading = true;
    await FirebaseFirestore.instance
        .collection('Student')
        .doc(studentsList[index].email)
        .delete();

    studentsList.removeAt(index);
    isLoading = false;
  }
}
