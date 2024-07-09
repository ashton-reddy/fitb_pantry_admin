import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/items_page/items_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final ItemsPageStore pageStore = ItemsPageStore();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated ? Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView.builder(
            itemCount: pageStore.itemsList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      context.router.replace(const AddItemRoute()).then((value) => pageStore.loadPage());
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Add Item',
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
                      index.toString(),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade400,
                      ),
                      child: Image.network(
                        pageStore.itemsList[index - 1].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Category: ${pageStore.itemsList[index - 1].group}'),
                        Text(
                          pageStore.itemsList[index - 1].label,
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
                          await pageStore.deleteItem(index - 1);
                        }
                      },
                      child: const Icon(
                        Icons.delete,
                      ),
                    ),
                      GestureDetector(
                              onTap: () {
                                context.router.push(EditItemRoute(
                                    item:
                                        pageStore.itemsList[index - 1]));
                              },
                              child: const Icon(
                                Icons.edit,
                              ))
                  ],
                ),
              );
            },
          ),
        );
      }),
    ) : NotPermitted();
  }
}
