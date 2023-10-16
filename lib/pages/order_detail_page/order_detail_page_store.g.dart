// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderDetailPageStore on _OrderDetailPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OrderDetailPageStore.isLoading', context: context);

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

  late final _$studentModelAtom =
      Atom(name: '_OrderDetailPageStore.studentModel', context: context);

  @override
  StudentModel? get studentModel {
    _$studentModelAtom.reportRead();
    return super.studentModel;
  }

  @override
  set studentModel(StudentModel? value) {
    _$studentModelAtom.reportWrite(value, super.studentModel, () {
      super.studentModel = value;
    });
  }

  late final _$itemsListAtom =
      Atom(name: '_OrderDetailPageStore.itemsList', context: context);

  @override
  List<ItemModel> get itemsList {
    _$itemsListAtom.reportRead();
    return super.itemsList;
  }

  @override
  set itemsList(List<ItemModel> value) {
    _$itemsListAtom.reportWrite(value, super.itemsList, () {
      super.itemsList = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_OrderDetailPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
studentModel: ${studentModel},
itemsList: ${itemsList}
    ''';
  }
}
