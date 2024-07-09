import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/pages/completed_oreders_page/completed_orders_page.dart';
import 'package:fitbadmin/pages/orders_page/orders_page_store.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fitbadmin/routing/app_router.dart';

enum FilterOptions {
  active,
  completed,
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final OrdersPageStore pageStore = OrdersPageStore();
  FilterOptions filterOption = FilterOptions.active; // Default to active

  @override
  void initState() {
    pageStore.loadPage();
    pageStore.updateWeeks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return authenticated
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Observer(builder: (context) {
              if (pageStore.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: Text(
                              'Orders',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (filterOption == FilterOptions.active)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 245),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        pageStore.makeOrdersPdf();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffAD0075),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 10,
                                        ),
                                        shadowColor:
                                            Colors.grey.withOpacity(0.5),
                                        elevation: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Download School Orders',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 204),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        pageStore.makeInvPdf();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffAD0075),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 10,
                                        ),
                                        shadowColor:
                                            Colors.grey.withOpacity(0.5),
                                        elevation: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Download Inventory',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 7),
                                          Icon(
                                            Icons.download,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 190),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (await confirm(
                                          context,
                                          title: const Text('Confirm'),
                                          content: const Text(
                                              'Would you like to remove?'),
                                          textOK: const Text('Yes'),
                                          textCancel: const Text('No'),
                                        )) {
                                          pageStore.completeOrders();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffAD0075),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 16,
                                          horizontal: 10,
                                        ),
                                        shadowColor:
                                            Colors.grey.withOpacity(0.5),
                                        elevation: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Complete All Orders',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                )
                              ],
                            ),
                          Observer(builder: (context) {
                            if (filterOption == FilterOptions.active &&
                                pageStore.isLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              );
                            }
                            return Expanded(
                              child: filterOption == FilterOptions.active
                                  ? ListView.builder(
                                      itemCount: pageStore.ordersList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                (index + 1).toString(),
                                              ),
                                              SizedBox(width: 16),
                                              GestureDetector(
                                                onTap: () async {
                                                  var orderModel =
                                                      await context.router.push(
                                                    OrderDetailRoute(
                                                      orderModel: pageStore
                                                          .ordersList[index],
                                                      completed: false,
                                                      timestamp:
                                                          pageStore.timestamp ??
                                                              DateTime.now(),
                                                    ),
                                                  );
                                                  pageStore.ordersList
                                                      .remove(orderModel);
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          offset:
                                                              Offset(0.0, 4.0),
                                                          blurRadius: 6.0,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          pageStore
                                                              .ordersList[index]
                                                              .studentId,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        const Icon(
                                                          Icons
                                                              .arrow_circle_right_outlined,
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
                                    )
                                  : CompletedOrdersPage(),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          const Text(
                            'Filter',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10), // Reduced space
                          const Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RadioListTile<FilterOptions>(
                            dense: true, // Reduced vertical space
                            title: const Text(
                              'Active',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: FilterOptions.active,
                            groupValue: filterOption,
                            onChanged: (value) {
                              setState(() {
                                filterOption = value!;
                              });
                            },
                            activeColor: const Color(0xffFF6600),
                          ),
                          RadioListTile<FilterOptions>(
                            dense: true, // Reduced vertical space
                            title: const Text(
                              'Completed',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: FilterOptions.completed,
                            groupValue: filterOption,
                            onChanged: (value) {
                              setState(() {
                                filterOption = value!;
                              });
                            },
                            activeColor: const Color(0xffFF6600),
                          ),
                          const SizedBox(height: 10), // Reduced space
                          const Text(
                            'School',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton<String>(
                            value: pageStore.selectedSchool,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                            ),
                            elevation: 16,
                            style: const TextStyle(color: Color(0xffAD0075)),
                            underline: Container(
                              height: 2,
                              color: const Color(0xffAD0075),
                            ),
                            onChanged: (String? value) {
                              pageStore.onSchoolChanged(
                                value ?? pageStore.selectedSchool,
                              );
                            },
                            items: pageStore.schools
                                .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 10), // Reduced space
                          const Text(
                            'Week',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: pageStore.weeks.map((week) {
                              return RadioListTile<String>(
                                  title: Text(
                                    week,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  value: week,
                                  groupValue: pageStore.selectedWeek,
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      pageStore.onWeekChanged(value);
                                    }
                                  },
                                  activeColor: const Color(0xffFF6600));
                            }).toList(),
                          )
                        ])),
                  )
                ],
              );
            }),
          )
        : NotPermitted();
  }
}
