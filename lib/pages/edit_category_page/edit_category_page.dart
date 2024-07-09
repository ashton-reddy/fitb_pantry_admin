import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/pages/edit_category_page/edit_category_page_store.dart';
import 'package:fitbadmin/models/category_model/category_model.dart';
import 'package:fitbadmin/pages/add_category_page/add_category_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:fitbadmin/widgets/logo_header.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';

@RoutePage()
class EditCategoryPage extends StatefulWidget {
  final CategoryModel category;
  const EditCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  late EditCategoryPageStore pageStore;

  final TextEditingController groupController = TextEditingController();
  final TextEditingController limitController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageStore = EditCategoryPageStore(widget.category, AddCategoryPageStore());
    pageStore.loadPage();
    super.initState();

    groupController.text = widget.category.name ?? '';
    limitController.text = widget.category.totalLimit.toString();
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
                                'Edit Category',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                controller: groupController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  hintText: 'Name',
                                  fillColor: const Color(0xfff2f4fa),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              TextFormField(
                                controller: limitController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  hintText: 'limit',
                                  fillColor: const Color(0xfff2f4fa),
                                  filled: true,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await pageStore.saveCategorys(
                                    groupController.text,
                                    int.parse(limitController.text),
                                  );
                                  Future.delayed(Duration.zero, () {
                                    if (context.mounted) {
                                      context.router.replace(
                                        const CategoriesRoute(),
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
