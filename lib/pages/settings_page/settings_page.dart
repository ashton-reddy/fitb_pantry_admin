import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingItem(
            title: 'Items',
            route: ItemsRoute(),
          ),
          SettingItem(
            title: 'Categories',
            route: CategoriesRoute(),
          ),
          SettingItem(
            title: 'Schools',
            route: SchoolsRoute(),
          ),
          SettingItem(
            title: 'Email Sender',
            route: EmailSenderRoute(),
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final PageRouteInfo route;
  final String title;

  const SettingItem({Key? key, required this.route, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.router.push(
          route,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFF6600),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffFF6600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
