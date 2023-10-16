// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schools_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SchoolsPageStore on _SchoolsPageStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SchoolsPageStore.isLoading', context: context);

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

  late final _$schoolsListAtom =
      Atom(name: '_SchoolsPageStore.schoolsList', context: context);

  @override
  ObservableList<SchoolModel> get schoolsList {
    _$schoolsListAtom.reportRead();
    return super.schoolsList;
  }

  @override
  set schoolsList(ObservableList<SchoolModel> value) {
    _$schoolsListAtom.reportWrite(value, super.schoolsList, () {
      super.schoolsList = value;
    });
  }

  late final _$loadPageAsyncAction =
      AsyncAction('_SchoolsPageStore.loadPage', context: context);

  @override
  Future<void> loadPage() {
    return _$loadPageAsyncAction.run(() => super.loadPage());
  }

  late final _$deleteSchoolAsyncAction =
      AsyncAction('_SchoolsPageStore.deleteSchool', context: context);

  @override
  Future<void> deleteSchool(int index) {
    return _$deleteSchoolAsyncAction.run(() => super.deleteSchool(index));
  }

  late final _$deactivateSchoolAsyncAction =
      AsyncAction('_SchoolsPageStore.deactivateSchool', context: context);

  @override
  Future<void> deactivateSchool(int index, bool currentStatus) {
    return _$deactivateSchoolAsyncAction
        .run(() => super.deactivateSchool(index, currentStatus));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
schoolsList: ${schoolsList}
    ''';
  }
}
