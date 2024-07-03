import 'package:auto_route/auto_route.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:fitbadmin/main.dart';
import 'package:fitbadmin/models/order_model/order_model.dart';
import 'package:fitbadmin/pages/order_detail_page/order_detail_page_store.dart';
import 'package:fitbadmin/widgets/not_permitted_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class OrderDetailPage extends StatefulWidget {
  final OrderModel orderModel;
  final bool completed;
  final DateTime? timestamp;

  const OrderDetailPage(
      {Key? key,
      required this.orderModel,
      required this.completed,
      required this.timestamp})
      : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  late final OrderDetailPageStore pageStore;

  @override
  void initState() {
    pageStore = OrderDetailPageStore(widget.orderModel, widget.timestamp);
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
                child: pageStore.itemsList.isNotEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: GestureDetector(
                              onTap: () {
                                pageStore.makePdf();
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Download order details',
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
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: pageStore.itemsList.length + 2,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  if (widget.completed) {
                                    return Text(
                                      'Order from ${widget.orderModel.studentId}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  } else {
                                    if (pageStore.studentModel != null) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order from ${pageStore.studentModel!.firstName} ${pageStore.studentModel!.lastName}',
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Date ordered: ${pageStore.timestamp.toString()}',
                                            ),
                                            Text(
                                              'Email: ${pageStore.studentModel!.email}',
                                            ),
                                            Text(
                                              'Phone number: ${pageStore.studentModel!.phoneNumber}',
                                            ),
                                            Text(
                                              'School: ${pageStore.studentModel!.school}',
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Text(
                                        'Student DELETED',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }
                                  }
                                }
                                if (index == pageStore.itemsList.length + 1) {
                                  return widget.completed
                                      ? const SizedBox()
                                      : GestureDetector(
                                          onTap: () async {
                                            if (await confirm(
                                              context,
                                              title: const Text('Confirm'),
                                              content: const Text(
                                                  'Would you like to remove?'),
                                              textOK: const Text('Yes'),
                                              textCancel: const Text('No'),
                                            )) {
                                              pageStore.moveDocument();
                                              Future.delayed(Duration.zero, () {
                                                if (context.mounted) {
                                                  context.router
                                                      .pop(widget.orderModel);
                                                }
                                              });
                                            }
                                          },
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                maxWidth: 500),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 200, vertical: 32),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 18,
                                              vertical: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xffAD0075),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Complete Order',
                                                style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                }
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 32),
                                  child: Row(
                                    children: [
                                      Text(
                                        (index).toString(),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.grey.shade400,
                                        ),
                                        child: pageStore.itemsList[index - 1]
                                                    .label ==
                                                'deleted'
                                            ? Image.asset(
                                                pageStore
                                                    .itemsList[index - 1].image,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.network(
                                                pageStore
                                                    .itemsList[index - 1].image,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'quantity: ${widget.orderModel.items[index - 1].quantity}'),
                                          Text(
                                            pageStore
                                                .itemsList[index - 1].label,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order from ${widget.orderModel.studentId}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            'Items for this order are deleted',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          widget.completed
                              ? const SizedBox()
                              : GestureDetector(
                                  onTap: () async {
                                    if (await confirm(
                                      context,
                                      title: const Text('Confirm'),
                                      content: const Text(
                                          'Would you like to remove?'),
                                      textOK: const Text('Yes'),
                                      textCancel: const Text('No'),
                                    )) {
                                      pageStore.moveDocument();
                                      Future.delayed(Duration.zero, () {
                                        if (context.mounted) {
                                          context.router.pop(widget.orderModel);
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 200, vertical: 32),
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
                                        'Remove Order',
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
              );
            }),
          )
        : const NotPermitted();
  }
}
