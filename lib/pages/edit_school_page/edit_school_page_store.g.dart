// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_school_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditSchoolPageStore on _EditSchoolPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EditSchoolPageStore.isLoading', context: context);

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
      AsyncAction('_EditSchoolPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$saveSchoolsAsyncAction =
      AsyncAction('_EditSchoolPageStore.saveSchools', context: context);

  @override
  Future<void> saveSchools(
      String name, int openDate, int closeDate, String email) {
    return _$saveSchoolsAsyncAction
        .run(() => super.saveSchools(name, openDate, closeDate, email));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
