import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/pages/edit_item_page/edit_item_page.dart';
import 'package:fitbadmin/pages/sign_in_page/sign_in_page.dart';
import 'package:fitbadmin/pages/home_page/home_page.dart';
import 'package:fitbadmin/pages/items_page/items_page.dart';
import 'package:fitbadmin/pages/categories_page/categories_page.dart';
import 'package:fitbadmin/pages/schools_page/schools_page.dart';
import 'package:fitbadmin/pages/add_item_page/add_item_page.dart';
import 'package:fitbadmin/pages/add_category_page/add_category_page.dart';
import 'package:fitbadmin/pages/order_detail_page/order_detail_page.dart';
import 'package:fitbadmin/pages/add_school_page/add_school_page.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:fitbadmin/pages/edit_school_page/edit_school_page.dart';
import 'package:fitbadmin/pages/edit_category_page/edit_category_page.dart';
import 'package:flutter/material.dart';
import 'package:fitbadmin/models/category_model/category_model.dart';
import 'package:fitbadmin/models/school_model/school_model.dart';
import 'package:fitbadmin/pages/edit_item_page/edit_item_page.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:fitbadmin/pages/email_sender_page/email_sender_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: AddItemRoute.page,
        ),
        AutoRoute(
          page: ItemsRoute.page,
        ),
        AutoRoute(
          page: CategoriesRoute.page,
        ),
        AutoRoute(
          page: SchoolsRoute.page,
        ),
        AutoRoute(
          page: OrderDetailRoute.page,
        ),
        AutoRoute(
          page: AddCategoryRoute.page,
        ),
        AutoRoute(
          page: AddSchoolRoute.page,
        ),
        AutoRoute(page: EditSchoolRoute.page),
        AutoRoute(page: EditCategoryRoute.page),
        AutoRoute(page: EditItemRoute.page),
        AutoRoute(page: EmailSenderRoute.page)
      ];
}
