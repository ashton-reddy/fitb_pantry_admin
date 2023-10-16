// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemsPageStore on _ItemsPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ItemsPageStore.isLoading', context: context);

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

  late final _$itemsListAtom =
      Atom(name: '_ItemsPageStore.itemsList', context: context);

  @override
  ObservableList<ItemModel> get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(ObservableList<ItemModel> value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_ItemsPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('_ItemsPageStore.deleteItem', context: context);

  @override
  Future<void> deleteItem(int index) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
itemsList: ${itemsList}
    ''';
  }
}
