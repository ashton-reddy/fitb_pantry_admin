// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdersPageStore on _OrdersPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OrdersPageStore.isLoading', context: context);

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

  late final _$ordersListAtom =
      Atom(name: '_OrdersPageStore.ordersList', context: context);

  @override
  ObservableList<OrderModel> get ordersList {
    _$ordersListAtom.reportRead();
    return super.ordersList;
  }

  @override
  set ordersList(ObservableList<OrderModel> value) {
    _$ordersListAtom.reportWrite(value, super.ordersList, () {
      super.ordersList = value;
    });
  }

  late final _$schoolsAtom =
      Atom(name: '_OrdersPageStore.schools', context: context);

  @override
  ObservableList<String> get schools {
    _$schoolsAtom.reportRead();
    return super.schools;
  }

  @override
  set schools(ObservableList<String> value) {
    _$schoolsAtom.reportWrite(value, super.schools, () {
      super.schools = value;
    });
  }

  late final _$selectedSchoolAtom =
      Atom(name: '_OrdersPageStore.selectedSchool', context: context);

  @override
  String get selectedSchool {
    _$selectedSchoolAtom.reportRead();
    return super.selectedSchool;
  }

  @override
  set selectedSchool(String value) {
    _$selectedSchoolAtom.reportWrite(value, super.selectedSchool, () {
      super.selectedSchool = value;
    });
  }

  late final _$studentNameAtom =
      Atom(name: '_OrdersPageStore.studentName', context: context);

  @override
  String get studentName {
    _$studentNameAtom.reportRead();
    return super.studentName;
  }

  @override
  set studentName(String value) {
    _$studentNameAtom.reportWrite(value, super.studentName, () {
      super.studentName = value;
    });
  }

  late final _$timestampAtom =
      Atom(name: '_OrdersPageStore.timestamp', context: context);

  @override
  DateTime? get timestamp {
    _$timestampAtom.reportRead();
    return super.timestamp;
  }

  @override
  set timestamp(DateTime? value) {
    _$timestampAtom.reportWrite(value, super.timestamp, () {
      super.timestamp = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_OrdersPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$reloadPageAsyncAction =
      AsyncAction('_OrdersPageStore.reloadPage', context: context);

  @override
  Future reloadPage() {
    return _$reloadPageAsyncAction.run(() => super.reloadPage());
  }

  late final _$completeOrdersAsyncAction =
      AsyncAction('_OrdersPageStore.completeOrders', context: context);

  @override
  Future completeOrders() {
    return _$completeOrdersAsyncAction.run(() => super.completeOrders());
  }

  late final _$onSchoolChangedAsyncAction =
      AsyncAction('_OrdersPageStore.onSchoolChanged', context: context);

  @override
  Future<void> onSchoolChanged(String newSchool) {
    return _$onSchoolChangedAsyncAction
        .run(() => super.onSchoolChanged(newSchool));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ordersList: ${ordersList},
schools: ${schools},
selectedSchool: ${selectedSchool},
studentName: ${studentName},
timestamp: ${timestamp}
    ''';
  }
}
