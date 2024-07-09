// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fitbadmin/models/category_model/category_model.dart' as _i17;
import 'package:fitbadmin/models/item_model/item_model.dart' as _i15;
import 'package:fitbadmin/models/order_model/order_model.dart' as _i13;
import 'package:fitbadmin/models/school_model/school_model.dart' as _i19;
import 'package:fitbadmin/pages/add_category_page/add_category_page_store.dart'
    as _i9;
import 'package:fitbadmin/pages/add_item_page/add_item_page_store.dart' as _i3;
import 'package:fitbadmin/pages/add_school_page/add_school_page_store.dart'
    as _i4;
import 'package:fitbadmin/pages/categories_page/categories_page_store.dart'
    as _i11;
import 'package:fitbadmin/pages/completed_oreders_page/completed_orders_page_store.dart'
    as _i7;
import 'package:fitbadmin/pages/edit_category_page/edit_category_page_store.dart'
    as _i16;
import 'package:fitbadmin/pages/edit_item_page/edit_item_page_store.dart'
    as _i14;
import 'package:fitbadmin/pages/edit_school_page/edit_school_page_store.dart'
    as _i18;
import 'package:fitbadmin/pages/items_page/items_page_store.dart' as _i8;
import 'package:fitbadmin/pages/order_detail_page/order_detail_page_store.dart'
    as _i12;
import 'package:fitbadmin/pages/orders_page/orders_page_store.dart' as _i10;
import 'package:fitbadmin/pages/schools_page/schools_page_store.dart' as _i6;
import 'package:fitbadmin/pages/students_page/students_page_store.dart' as _i5;
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
    gh.factory<_i3.AddItemPageStore>(() => _i3.AddItemPageStore());
    gh.factory<_i4.AddSchoolPageStore>(() => _i4.AddSchoolPageStore());
    gh.factory<_i5.StudentsPageStore>(() => _i5.StudentsPageStore());
    gh.factory<_i6.SchoolsPageStore>(() => _i6.SchoolsPageStore());
    gh.factory<_i7.CompletedOrdersPageStore>(
        () => _i7.CompletedOrdersPageStore());
    gh.factory<_i8.ItemsPageStore>(() => _i8.ItemsPageStore());
    gh.factory<_i9.AddCategoryPageStore>(() => _i9.AddCategoryPageStore());
    gh.factory<_i10.OrdersPageStore>(() => _i10.OrdersPageStore());
    gh.factory<_i11.CategoriesPageStore>(() => _i11.CategoriesPageStore());
    gh.factory<_i12.OrderDetailPageStore>(() => _i12.OrderDetailPageStore(
          gh<_i13.OrderModel>(),
          gh<DateTime>(),
        ));
    gh.factory<_i14.EditItemPageStore>(() => _i14.EditItemPageStore(
          gh<_i15.ItemModel>(),
          gh<_i3.AddItemPageStore>(),
        ));
    gh.factory<_i16.EditCategoryPageStore>(() => _i16.EditCategoryPageStore(
          gh<_i17.CategoryModel>(),
          gh<_i9.AddCategoryPageStore>(),
        ));
    gh.factory<_i18.EditSchoolPageStore>(() => _i18.EditSchoolPageStore(
          gh<_i19.SchoolModel>(),
          gh<_i4.AddSchoolPageStore>(),
        ));
    return this;
  }
}
