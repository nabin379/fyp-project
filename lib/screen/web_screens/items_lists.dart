import 'package:cem/core/utils/validation.dart';
import 'package:cem/features/bid/models/bid_invitation.dart';
import 'package:cem/features/bid/providers/date_provider.dart';
import 'package:cem/screen/web_screens/bid_release_finalpage.dart';
import 'package:cem/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ItemsListsPage extends StatefulWidget {
  final Bid bid;

  const ItemsListsPage({super.key, required this.bid});

  @override
  State<ItemsListsPage> createState() => _ItemsListsPageState();
}

class _ItemsListsPageState extends State<ItemsListsPage> {
  final TextEditingController _goodsController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _specificationsController =
      TextEditingController();
  final TextEditingController _deliveryTimeController = TextEditingController();

  List<Item> listOfItems = [];

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void _addToList() {
    // handle validation
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      _showValidationToast("Please give all the infomration of items");
      return;
    }

    final item = Item(
        name: _goodsController.text,
        quantity: int.tryParse(_quantityController.text),
        specification: _specificationsController.text,
        deliveryTime: deliveryDate);

    listOfItems.add(item);
    _goodsController.clear();
    _quantityController.clear();
    _specificationsController.clear();
    _deliveryTimeController.clear();
    deliveryDate = null;

    setState(() {});
  }

  DateTime? deliveryDate;
// update////////////////////////////////////////////////////////

  void _showUpdateDialog(int index) {
    // Create temporary controllers with existing values
    TextEditingController goodsController =
        TextEditingController(text: listOfItems[index].name);
    TextEditingController quantityController =
        TextEditingController(text: listOfItems[index].quantity?.toString());
    TextEditingController specificationsController =
        TextEditingController(text: listOfItems[index].specification);
    TextEditingController deliveryTimeController = TextEditingController(
        text: listOfItems[index].deliveryTime?.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Item"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: goodsController,
                decoration: const InputDecoration(labelText: "Goods"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: specificationsController,
                decoration: const InputDecoration(labelText: "Specifications"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: deliveryTimeController,
                decoration: const InputDecoration(labelText: "Delivery Time"),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Update the item in the list
              setState(() {
                listOfItems[index] = Item(
                    name: goodsController.text,
                    quantity: int.tryParse(quantityController.text),
                    specification: specificationsController.text,
                    deliveryTime: deliveryDate);
              });
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }

  //////////////////////////////// end of update section//////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 180,
                      child: BidInvitationCustomTextFormField(
                        controller: _goodsController,
                        labelText: 'Goods',
                        validator: (val) {
                          return Validation.validateEmpty(
                              val, "Please give goods");
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 180,
                        child: BidInvitationCustomTextFormField(
                          controller: _quantityController,
                          labelText: 'Quantity',
                          validator: (val) {
                            return Validation.validateEmpty(
                                val, "Please give quantity");
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 180,
                        child: BidInvitationCustomTextFormField(
                          controller: _specificationsController,
                          labelText: 'Specifications',
                          validator: (val) {
                            return Validation.validateEmpty(
                                val, "Please give specifications");
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    ChangeNotifierProvider(
                      create: (context) => DateProvider(),
                      child: Consumer<DateProvider>(
                        builder: (context, dateProvider, _) {
                          // change the value of text controller
                          _deliveryTimeController.text =
                              dateProvider.pickedDate?.toIso8601String() ?? "";

                          // initialize delivery Date
                          deliveryDate = dateProvider.pickedDate;

                          return SizedBox(
                              width: 180,
                              child: BidInvitationCustomTextFormField(
                                controller: _deliveryTimeController,
                                labelText: 'Delivery Date',
                                readOnly: true,
                                onTap: () {
                                  dateProvider.pickDate(context);
                                },
                                validator: (val) {
                                  return Validation.validateEmpty(
                                      val, "Please select valid delivery date");
                                },
                              ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: _addToList,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 221, 110, 240),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Text(
                        'Add to List',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  "Added Items",
                  style: TextStyle(
                      height: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 47, 10)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(
                      color: const Color.fromARGB(255, 132, 37, 37),
                      width: 1,
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(50), // Column for index
                      1: FlexColumnWidth(), // Column for goods
                      2: FlexColumnWidth(), // Column for quantity
                      3: FlexColumnWidth(), // Column for specifications
                      4: FlexColumnWidth(), // Column for delivery time
                      5: FixedColumnWidth(150), // Column for remove button
                    },
                    children: [
                      // Header Row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "No",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Goods",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Quantity",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Specifications",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Delivery Time",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Remove or Update",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      // Data Rows
                      for (int index = 0; index < listOfItems.length; index++)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${index + 1}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listOfItems[index].name ?? "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listOfItems[index].quantity?.toString() ?? "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listOfItems[index].specification ?? "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                listOfItems[index].deliveryTime?.toString() ??
                                    "",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 9, 9),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Update Button
                                  IconButton(
                                    onPressed: () {
                                      _showUpdateDialog(
                                          index); // Call the function to show update dialog
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  // Delete Button
                                  IconButton(
                                    onPressed: () {
                                      listOfItems.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (listOfItems.isEmpty) {
                            _showValidationToast("Please add atleast one item");
                            return;
                          }

                          // create bid invitation class
                          final bidInvitation =
                              BidInvitation(bid: widget.bid, items: [
                            ...listOfItems,
                          ]);

                          // call api from
                          print("gello");
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showValidationToast(String text) {
    Fluttertoast.showToast(msg: text, webPosition: "center");
  }
}
