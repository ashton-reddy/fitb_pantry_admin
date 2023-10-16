import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'add_item_page_store.g.dart';

@injectable
class AddItemPageStore = _AddItemPageStore with _$AddItemPageStore;

abstract class _AddItemPageStore with Store {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _AddItemPageStore();

  @observable
  String imageUrl = '';

  @observable
  bool isLoading = false;

  @observable
  List<DropdownMenuItem> groupsList = [];

  Uint8List? bytesFromPicker;

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
  Future<void> uploadImage(String picName) async {
    isLoading = true;
    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child("$picName.png");
    if (bytesFromPicker != null) {
      try {
        await imageRef.putData(
          bytesFromPicker!,
          SettableMetadata(
            contentType: "image/png",
          ),
        );
      } catch (e) {
        isLoading = false;
        return;
      }
      imageUrl = await imageRef.getDownloadURL();
    }
    isLoading = false;
  }

  Future<void> imagePicker() async {
    bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
  }

  @action
  Future<void> saveItems(String group, String image, String label) async {
    isLoading = true;
    Map<String, dynamic> dataToSave = {
      'group': group,
      'image': image,
      'label': label,
      'id': label
    };
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Items');
    await collectionRef.doc(label).set(dataToSave);
    isLoading = false;
  }
}
