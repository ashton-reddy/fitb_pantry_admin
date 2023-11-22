import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/completed_oreders_page/completed_orders_page.dart';
import 'package:fitbadmin/pages/orders_page/orders_page_store.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitbadmin/routing/app_router.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final OrdersPageStore pageStore = OrdersPageStore();
  bool isActiveSelected = true;

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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isActiveSelected) {
                        setState(() {
                          isActiveSelected = true;
                        });
                      }
                    },
                    child: Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 14,
                        color: isActiveSelected
                            ? const Color(0xffAD0075)
                            : const Color(0xffFF6600),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 56,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isActiveSelected) {
                        setState(() {
                          isActiveSelected = false;
                        });
                      }
                    },
                    child: Text(
                      'In Database',
                      style: TextStyle(
                        fontSize: 14,
                        color: !isActiveSelected
                            ? const Color(0xffAD0075)
                            : const Color(0xffFF6600),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButton<String>(
                value: pageStore.selectedSchool,
                icon: const Icon(Icons.arrow_downward, color: Colors.black,),
                elevation: 16,
                style: const TextStyle(color: Color(0xffAD0075)),
                underline: Container(
                  height: 2,
                  color: const Color(0xffAD0075),
                ),
                onChanged: (String? value) {
                  pageStore.onSchoolChanged(value ?? pageStore.selectedSchool);
                },
                items: pageStore.schools.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              isActiveSelected ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    pageStore.makePdf();
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Download school orders',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffAD0075),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.download,
                        color: Color(0xffAD0075),
                      ),
                    ],
                  ),
                ),
              ) : const SizedBox(),
              const SizedBox(
                height: 16,
              ),
              isActiveSelected ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: GestureDetector(
                  onTap: () async {
                    if (await confirm(
                      context,
                      title: const Text('Confirm'),
                      content:
                      const Text('Would you like to remove?'),
                      textOK: const Text('Yes'),
                      textCancel: const Text('No'),
                    )) {
                      pageStore.completeOrders();
                    }
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Complete all orders',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffAD0075),
                        ),
                      ),
                    ],
                  ),
                ),
              ) : const SizedBox(),
              Observer(builder: (context) {
                if (pageStore.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (isActiveSelected) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: pageStore.ordersList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (index + 1).toString(),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var orderModel = await context.router.push(
                                    OrderDetailRoute(
                                      orderModel: pageStore.ordersList[index],
                                      completed: false,
                                    ),
                                  );
                                  pageStore.ordersList.remove(orderModel);
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
                                      children: [
                                        Text(
                                          pageStore.ordersList[index].studentId,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.arrow_circle_right_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Expanded(
                    child: CompletedOrdersPage(),
                  );
                }
              }),
            ],
          ),
        );
      }),
    ) : NotPermitted();
  }
}
