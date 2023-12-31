// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddCategoryPageStore on _AddCategoryPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AddCategoryPageStore.isLoading', context: context);

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

  late final _$loadPageAsyncAction =
      AsyncAction('_AddCategoryPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$saveCategorysAsyncAction =
      AsyncAction('_AddCategoryPageStore.saveCategorys', context: context);

  @override
  Future<void> saveCategorys(String name, int limit) {
    return _$saveCategorysAsyncAction
        .run(() => super.saveCategorys(name, limit));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
