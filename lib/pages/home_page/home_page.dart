import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/orders_page/orders_page.dart';
import 'package:fitbadmin/pages/settings_page/settings_page.dart';
import 'package:fitbadmin/pages/students_page/students_page.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<String> titles = [
    'Orders',
    'Students',
    'Settings',
  ];

  final List icons = [
    Icons.fastfood_outlined,
    Icons.amp_stories,
    Icons.incomplete_circle,
    Icons.school,
    Icons.people_outline,
    Icons.category,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated ? DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: VerticalTabs(
                  tabBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  //tabsElevation: 10,
                  //tabsShadowColor: Colors.grey.shade500,
                  tabsWidth: 200,
                  indicatorColor: Colors.white,
                  selectedTabBackgroundColor: Colors.white,
                  indicatorWidth: 5,
                  disabledChangePageFromContentView: true,
                  initialIndex: _pageIndex,
                  onSelect: (index) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        _pageIndex = index;
                      });
                    });
                  },
                  tabs: <Tab>[
                    tab(titles[0], icons[0], 0),
                    tab(titles[1], icons[1], 1),
                    tab(titles[2], icons[2], 2),
                  ],
                  contents: const <Widget>[
                    OrdersPage(),
                    StudentsPage(),
                    SettingsPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ) : const NotPermitted();
  }

  Tab tab(title, icon, index) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: _pageIndex == index
                    ? const Color(0xffAD0075)
                    : const Color(0xffFF6600),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
          ),
          const Text(
            ' - Admin Panel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
