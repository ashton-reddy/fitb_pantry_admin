// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesPageStore on _CategoriesPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CategoriesPageStore.isLoading', context: context);

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

  late final _$categoriesListAtom =
      Atom(name: '_CategoriesPageStore.categoriesList', context: context);

  @override
  ObservableList<CategoryModel> get categoriesList {
    _$categoriesListAtom.reportRead();
    return super.categoriesList;
  }

  @override
  set categoriesList(ObservableList<CategoryModel> value) {
    _$categoriesListAtom.reportWrite(value, super.categoriesList, () {
      super.categoriesList = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_CategoriesPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$addCategoryAsyncAction =
      AsyncAction('_CategoriesPageStore.addCategory', context: context);

  @override
  Future<void> addCategory() {
    return _$addCategoryAsyncAction.run(() => super.addCategory());
  }

  late final _$deleteCategoryAsyncAction =
      AsyncAction('_CategoriesPageStore.deleteCategory', context: context);

  @override
  Future<void> deleteCategory(int index) {
    return _$deleteCategoryAsyncAction.run(() => super.deleteCategory(index));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
categoriesList: ${categoriesList}
    ''';
  }
}
