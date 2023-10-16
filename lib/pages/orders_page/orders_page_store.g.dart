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

  late final _$loadPageAsyncAction =
      AsyncAction('_OrdersPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ordersList: ${ordersList}
    ''';
  }
}
