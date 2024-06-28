import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'add_school_page_store.g.dart';

@injectable
class AddSchoolPageStore = _AddSchoolPageStore with _$AddSchoolPageStore;

abstract class _AddSchoolPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _AddSchoolPageStore();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadPage() async {
    isLoading = true;
    isLoading = false;
  }

  @action
  Future<void> saveSchools(String name, int openDate, int closeDate, String email) async {
    isLoading = true;
    Map<String, dynamic> dataToSave = {
      'Name': name,
      'Open date': openDate,
      'Close date': closeDate,
      'Is active' : true,
      'Email': email
    };
    CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('School');
    await collectionRef.doc(name).set(dataToSave);
    isLoading = false;
  }
}