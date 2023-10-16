import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/pages/schools_page/schools_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class SchoolsPage extends StatefulWidget {
  const SchoolsPage({Key? key}) : super(key: key);

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  final SchoolsPageStore pageStore = SchoolsPageStore();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (pageStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
            itemCount: pageStore.schoolsList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      context.router
                          .push(const AddSchoolRoute())
                          .then((value) => pageStore.loadPage());
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Add School',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffAD0075),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xffAD0075),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  children: [
                    Text(
                      (index).toString(),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pageStore.schoolsList[index - 1].name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'open date: ${pageStore.schoolsList[index - 1].openDate}',
                        ),
                        Text(
                          'close date: ${pageStore.schoolsList[index - 1].closeDate}',
                        ),
                        Text(
                          'status: ${pageStore.schoolsList[index - 1].isActive ? 'active' : 'inactive'}',
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await confirm(
                              context,
                              title: const Text('Confirm'),
                              content: Text(
                                  'Would you like to ${pageStore.schoolsList[index - 1].isActive ? 'deactivate' : 'activate'} this school?'),
                              textOK: const Text('Yes'),
                              textCancel: const Text('No'),
                            )) {
                              await pageStore.deactivateSchool(index - 1,
                                  pageStore.schoolsList[index - 1].isActive);
                            }
                          },
                          child: Icon(
                            Icons.stop_circle_outlined,
                            color: pageStore.schoolsList[index - 1].isActive
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await confirm(
                              context,
                              title: const Text('Confirm'),
                              content: const Text(
                                  'Would you like to delete this school?'),
                              textOK: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Color(0xffAD0075),
                                ),
                              ),
                              textCancel: const Text(
                                'No',
                                style: TextStyle(
                                  color: Color(0xffAD0075),
                                ),
                              ),
                            )) {
                              await pageStore.deleteSchool(index - 1);
                            }
                          },
                          child: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
