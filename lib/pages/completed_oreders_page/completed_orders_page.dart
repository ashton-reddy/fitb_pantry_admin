import 'package:auto_route/auto_route.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/completed_oreders_page/completed_orders_page_store.dart';
import 'package:fitbadmin/pages/orders_page/orders_page_store.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitbadmin/routing/app_router.dart';

class CompletedOrdersPage extends StatefulWidget {
  const CompletedOrdersPage({Key? key}) : super(key: key);

  @override
  State<CompletedOrdersPage> createState() => _CompletedOrdersPageState();
}

class _CompletedOrdersPageState extends State<CompletedOrdersPage> {
  final CompletedOrdersPageStore pageStore = CompletedOrdersPageStore();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                    completed: true,
                                    timestamp:
                                        pageStore.timestamp ?? DateTime.now()),
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
            }),
          )
        : NotPermitted();
  }
}
