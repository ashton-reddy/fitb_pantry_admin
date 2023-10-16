// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_item_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddItemPageStore on _AddItemPageStore, Store {
  late final _$imageUrlAtom =
      Atom(name: '_AddItemPageStore.imageUrl', context: context);

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AddItemPageStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$groupsListAtom =
      Atom(name: '_AddItemPageStore.groupsList', context: context);

  @override
  List<DropdownMenuItem<dynamic>> get groupsList {
    _$groupsListAtom.reportRead();
    return super.groupsList;
  }

  @override
  set groupsList(List<DropdownMenuItem<dynamic>> value) {
    _$groupsListAtom.reportWrite(value, super.groupsList, () {
      super.groupsList = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_AddItemPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$uploadImageAsyncAction =
      AsyncAction('_AddItemPageStore.uploadImage', context: context);

  @override
  Future<void> uploadImage(String picName) {
    return _$uploadImageAsyncAction.run(() => super.uploadImage(picName));
  }

  late final _$saveItemsAsyncAction =
      AsyncAction('_AddItemPageStore.saveItems', context: context);

  @override
  Future<void> saveItems(String group, String image, String label) {
    return _$saveItemsAsyncAction
        .run(() => super.saveItems(group, image, label));
  }

  @override
  String toString() {
    return '''
imageUrl: ${imageUrl},
isLoading: ${isLoading},
groupsList: ${groupsList}
    ''';
  }
}
