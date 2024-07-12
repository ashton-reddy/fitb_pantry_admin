import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'email_sender_page_store.g.dart';

@injectable
class EmailSenderPageStore = _EmailSenderPageStore with _$EmailSenderPageStore;

abstract class _EmailSenderPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _EmailSenderPageStore();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadPage() async {
    isLoading = true;
    isLoading = false;
  }

  @action
  Future<void> saveEmailInfo(String email, String password) async {
    isLoading = true;
    Map<String, dynamic> dataToSave = {'email': email, 'password': password};
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Sender');

    await collectionRef.doc('senderEmail').set(dataToSave);
    isLoading = false;
  }
}
