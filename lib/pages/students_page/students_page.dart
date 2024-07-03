import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/students_page/students_page_store.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final StudentsPageStore pageStore = StudentsPageStore();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Observer(builder: (context) {
              if (pageStore.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView.builder(
                  itemCount: pageStore.studentsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${pageStore.studentsList[index].firstName} ${pageStore.studentsList[index].lastName}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'email: ${pageStore.studentsList[index].email}',
                              ),
                              Text(
                                'phone number: ${pageStore.studentsList[index].phoneNumber}',
                              ),
                              Text(
                                'school: ${pageStore.studentsList[index].school}',
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (await confirm(
                                context,
                                title: const Text('Confirm'),
                                content:
                                    const Text('Would you like to remove?'),
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
                                await pageStore.deleteStudents(index);
                              }
                            },
                            child: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          )
        : NotPermitted();
  }
}
