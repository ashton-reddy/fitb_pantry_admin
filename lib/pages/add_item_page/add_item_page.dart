import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/add_item_page/add_item_page_store.dart';
import 'package:fitbadmin/routing/app_router.dart';
import 'package:fitbadmin/widgets/logo_header.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class AddItemPage extends StatefulWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final AddItemPageStore pageStore = AddItemPageStore();

  final TextEditingController groupController = TextEditingController();

  final TextEditingController labelController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  dynamic selectedGroup;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated ? Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
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
                          'Add Item',
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
                          controller: labelController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Label',
                            fillColor: const Color(0xfff2f4fa),
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DropdownButtonFormField(
                          items: pageStore.groupsList,
                          onChanged: (groupValue) {
                            setState(() {
                              selectedGroup = groupValue;
                              groupController.text = groupValue;
                            });
                          },
                          value: selectedGroup,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Select a category',
                            fillColor: const Color(0xfff2f4fa),
                            filled: true,
                          ),
                          isExpanded: false,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          elevation: 16,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'required field';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () async {
                              await pageStore.imagePicker();
                              await pageStore.uploadImage(labelController.text);
                            },
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.grey.shade400,
                              ),
                              child: pageStore.imageUrl.isEmpty
                                  ? const Icon(Icons.add)
                                  : Image.memory(pageStore.bytesFromPicker!),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await pageStore.saveItems(
                              selectedGroup,
                              pageStore.imageUrl,
                              labelController.text,
                            );
                            Future.delayed(Duration.zero, () {
                              if (context.mounted) {
                                context.router.replace(const ItemsRoute());
                              }
                            });
                          },
                          child: Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            margin: const EdgeInsets.symmetric(horizontal: 200),
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
                                'Add Item',
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
    ) : NotPermitted();
  }
}
