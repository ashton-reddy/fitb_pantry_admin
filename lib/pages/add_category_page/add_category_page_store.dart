import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'add_category_page_store.g.dart';

@injectable
class AddCategoryPageStore = _AddCategoryPageStore with _$AddCategoryPageStore;

abstract class _AddCategoryPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _AddCategoryPageStore();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadPage() async {
    isLoading = true;
    isLoading = false;
  }

  @action
  Future<void> saveCategorys(String name, int limit) async {
    isLoading = true;
    Map<String, dynamic> dataToSave = {
      'name': name,
      'totalLimit': limit,
    };
    CollectionReference collectionRef =
    FirebaseFirestore.instance.collection('Groups');
    await collectionRef.doc(name).set(dataToSave);
    isLoading = false;
  }
}
