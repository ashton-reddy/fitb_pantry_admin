import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/add_item_page/add_item_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:fitbadmin/widgets/logo_header.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitbadmin/models/item_model/item_model.dart';
import 'package:fitbadmin/pages/email_sender_page/email_sender_page_store.dart';
import 'package:flutter/gestures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;

@RoutePage()
class EmailSenderPage extends StatefulWidget {
  const EmailSenderPage({Key? key}) : super(key: key);

  @override
  State<EmailSenderPage> createState() => _EmailSenderPageState();
}

class _EmailSenderPageState extends State<EmailSenderPage> {
  final EmailSenderPageStore pageStore = EmailSenderPageStore();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection('Sender')
        .doc('senderEmail')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // Retrieve data from Firestore
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        // Update controllers with retrieved data
        setState(() {
          emailController.text = data['email'] ?? '';
          passwordController.text = data['password'] ?? '';
        });
      } else {
        print('Document does not exist on the database');
      }
    });

    pageStore.loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated
        ? Scaffold(
            body: Observer(builder: (context) {
              if (pageStore.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const LogoHeaderWidget(),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                'Edit Email Sender',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  const url =
                                      'https://myaccount.google.com/apppasswords?rapt=AEjHL4Pa8k9NcFRgVXvQsUAxghczAnHcZyLmCPjgMION6jOiOfdLKEhdnanF_Cf_e34k7BxZ8rRRSvosQ20_OTHAj1Nxsmm1a_jmPmcse8ICR_w9T_zDClI';
                                  html.window.open(url, '_blank');
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text:
                                        'To retrieve an app password, follow these steps:\n',
                                    children: [
                                      const TextSpan(
                                        text: '1. Go to this link:\n',
                                      ),
                                      TextSpan(
                                        text:
                                            'https://myaccount.google.com/apppasswords?rapt=AEjHL4Pa8k9NcFRgVXvQsUAxghczAnHcZyLmCPjgMION6jOiOfdLKEhdnanF_Cf_e34k7BxZ8rRRSvosQ20_OTHAj1Nxsmm1a_jmPmcse8ICR_w9T_zDClI\n',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        // Replace with onTap action to open the link
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Replace with the actual link behavior you need
                                            // Example: launch('https://myaccount.google.com/apppasswords?rapt=AEjHL4Pa8k9NcFRgVXvQsUAxghczAnHcZyLmCPjgMION6jOiOfdLKEhdnanF_Cf_e34k7BxZ8rRRSvosQ20_OTHAj1Nxsmm1a_jmPmcse8ICR_w9T_zDClI');
                                          },
                                      ),
                                      const TextSpan(
                                        text:
                                            '2. In the box with "App name", type "flutter" then press "Create".\n',
                                      ),
                                      const TextSpan(
                                        text:
                                            '3. Copy text (should be a jumble of letters) and enter below. Please delete the spaces between the letters.',
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  hintText: 'Email',
                                  fillColor: const Color(0xfff2f4fa),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  hintText: 'Password',
                                  fillColor: const Color(0xfff2f4fa),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await pageStore.saveEmailInfo(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  Future.delayed(Duration.zero, () {
                                    if (context.mounted) {
                                      context.router.replace(
                                        const HomeRoute(),
                                      );
                                    }
                                  });
                                },
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 200),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffAD0075),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          )
        : NotPermitted();
  }
}
