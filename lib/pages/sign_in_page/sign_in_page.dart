import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/home_page/home_page.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var passwordCtrl = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = '';
  bool isLoading = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  initState() {
    init();
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Auth Failed'),
          content: Text(
            'Incorrect password',
          ),
        );
      },
    );
  }

  init() async {
    setState(() {
      isLoading = true;
    });

    final coll = firestore.collection("Config");
    final qs = await coll.doc("Admin").get();
    final data = qs.data();
    if (data != null) {
      password = data["pass"];
      print('chto? ' + password);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffAD0075),
                ),
              )
            : Center(
                child: Container(
                  height: 400,
                  width: 600,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: const Offset(3, 3))
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Filling in the Blanks',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                      const Text(
                        'Welcome to Admin Panel',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: passwordCtrl,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              contentPadding:
                                  const EdgeInsets.only(right: 0, left: 10),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                      icon: const Icon(Icons.close, size: 15),
                                      onPressed: () {
                                        passwordCtrl.clear();
                                      }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (passwordCtrl.text == password) {
                            authenticated = true;
                            context.router.replace(const HomeRoute());
                          } else {
                            dialogBuilder(context);
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color(0xffAD0075),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 10,
                                    offset: const Offset(2, 2))
                              ]),
                          child: const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
