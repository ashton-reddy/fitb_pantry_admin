import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:injectable/injectable.dart';
import 'package:fitbadmin/pages/add_item_page/add_item_page_store.dart';
import 'package:fitbadmin/pages/edit_item_page/edit_item_page_store.dart';

part 'edit_item_page_store.g.dart';

@injectable
class EditItemPageStore = _EditItemPageStore with _$EditItemPageStore;

abstract class _EditItemPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final ItemModel item;
  final AddItemPageStore addItemPageStore;

  @observable
  String imageUrl = '';

  @observable
  bool isLoading = false;

  @observable
  List<DropdownMenuItem> groupsList = [];

  Uint8List? bytesFromPicker;

  _EditItemPageStore(this.item, this.addItemPageStore) {
    imageUrl = addItemPageStore.imageUrl;
    bytesFromPicker = addItemPageStore.bytesFromPicker;
  }

  @action
  Future<void> loadPage() async {
    isLoading = true;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("Groups").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot snap = snapshot.docs[i];
      groupsList.add(
        DropdownMenuItem(
          value: snap.id,
          child: Text(
            snap.id,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
      );
    }
    isLoading = false;
  }

  @action
  Future<void> saveItems(String group, String image, String label) async {
    await addItemPageStore.saveItems(group, image, label);
  }

  @action
  Future<void> uploadImage(String picName) async {
    await addItemPageStore.uploadImage(picName);
  }

  Future<void> imagePicker() async {
    await addItemPageStore.imagePicker();
  }
}
