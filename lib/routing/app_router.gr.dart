// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCategoryPage(),
      );
    },
    AddItemRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddItemPage(),
      );
    },
    AddSchoolRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddSchoolPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesPage(),
      );
    },
    EditSchoolRoute.name: (routeData) {
      final args = routeData.argsAs<EditSchoolRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditSchoolPage(
          key: args.key,
          school: args.school,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    ItemsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ItemsPage(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailPage(
          key: args.key,
          orderModel: args.orderModel,
          completed: args.completed,
          timestamp: args.timestamp,
        ),
      );
    },
    SchoolsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SchoolsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
  };
}

/// generated route for
/// [AddCategoryPage]
class AddCategoryRoute extends PageRouteInfo<void> {
  const AddCategoryRoute({List<PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddItemPage]
class AddItemRoute extends PageRouteInfo<void> {
  const AddItemRoute({List<PageRouteInfo>? children})
      : super(
          AddItemRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddItemRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddSchoolPage]
class AddSchoolRoute extends PageRouteInfo<void> {
  const AddSchoolRoute({List<PageRouteInfo>? children})
      : super(
          AddSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddSchoolRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditSchoolPage]
class EditSchoolRoute extends PageRouteInfo<EditSchoolRouteArgs> {
  EditSchoolRoute({
    Key? key,
    required SchoolModel school,
    List<PageRouteInfo>? children,
  }) : super(
          EditSchoolRoute.name,
          args: EditSchoolRouteArgs(
            key: key,
            school: school,
          ),
          initialChildren: children,
        );

  static const String name = 'EditSchoolRoute';

  static const PageInfo<EditSchoolRouteArgs> page =
      PageInfo<EditSchoolRouteArgs>(name);
}

class EditSchoolRouteArgs {
  const EditSchoolRouteArgs({
    this.key,
    required this.school,
  });

  final Key? key;

  final SchoolModel school;

  @override
  String toString() {
    return 'EditSchoolRouteArgs{key: $key, school: $school}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ItemsPage]
class ItemsRoute extends PageRouteInfo<void> {
  const ItemsRoute({List<PageRouteInfo>? children})
      : super(
          ItemsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ItemsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailPage]
class OrderDetailRoute extends PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    Key? key,
    required OrderModel orderModel,
    required bool completed,
    required DateTime timestamp,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailRoute.name,
          args: OrderDetailRouteArgs(
            key: key,
            orderModel: orderModel,
            completed: completed,
            timestamp: timestamp,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const PageInfo<OrderDetailRouteArgs> page =
      PageInfo<OrderDetailRouteArgs>(name);
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({
    this.key,
    required this.orderModel,
    required this.completed,
    required this.timestamp,
  });

  final Key? key;

  final OrderModel orderModel;

  final bool completed;

  final DateTime timestamp;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{key: $key, orderModel: $orderModel, completed: $completed, timestamp: $timestamp}';
  }
}

/// generated route for
/// [SchoolsPage]
class SchoolsRoute extends PageRouteInfo<void> {
  const SchoolsRoute({List<PageRouteInfo>? children})
      : super(
          SchoolsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SchoolsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
