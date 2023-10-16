// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fitbadmin/models/order_model/order_model.dart' as _i10;
import 'package:fitbadmin/pages/add_category_page/add_category_page_store.dart'
    as _i3;
import 'package:fitbadmin/pages/add_item_page/add_item_page_store.dart' as _i4;
import 'package:fitbadmin/pages/add_school_page/add_school_page_store.dart'
    as _i5;
import 'package:fitbadmin/pages/categories_page/categories_page_store.dart'
    as _i6;
import 'package:fitbadmin/pages/completed_oreders_page/completed_orders_page_store.dart'
    as _i7;
import 'package:fitbadmin/pages/items_page/items_page_store.dart' as _i8;
import 'package:fitbadmin/pages/order_detail_page/order_detail_page_store.dart'
    as _i9;
import 'package:fitbadmin/pages/orders_page/orders_page_store.dart' as _i11;
import 'package:fitbadmin/pages/schools_page/schools_page_store.dart' as _i12;
import 'package:fitbadmin/pages/students_page/students_page_store.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddCategoryPageStore>(() => _i3.AddCategoryPageStore());
    gh.factory<_i4.AddItemPageStore>(() => _i4.AddItemPageStore());
    gh.factory<_i5.AddSchoolPageStore>(() => _i5.AddSchoolPageStore());
    gh.factory<_i6.CategoriesPageStore>(() => _i6.CategoriesPageStore());
    gh.factory<_i7.CompletedOrdersPageStore>(
        () => _i7.CompletedOrdersPageStore());
    gh.factory<_i8.ItemsPageStore>(() => _i8.ItemsPageStore());
    gh.factory<_i9.OrderDetailPageStore>(
        () => _i9.OrderDetailPageStore(gh<_i10.OrderModel>()));
    gh.factory<_i11.OrdersPageStore>(() => _i11.OrdersPageStore());
    gh.factory<_i12.SchoolsPageStore>(() => _i12.SchoolsPageStore());
    gh.factory<_i13.StudentsPageStore>(() => _i13.StudentsPageStore());
    return this;
  }
}
