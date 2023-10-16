import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/pages/categories_page/categories_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesPageStore pageStore = CategoriesPageStore();

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
            itemCount: pageStore.categoriesList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      context.router.replace(const AddCategoryRoute()).then((value) => pageStore.loadPage());
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Add Category',
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
                        Text('Limit: ${pageStore.categoriesList[index - 1].totalLimit}'),
                        Text(
                          'Category: ${pageStore.categoriesList[index - 1].name}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                          content: const Text('Would you like to remove?'),
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
                          await pageStore.deleteCategory(index - 1);
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
    );
  }
}
