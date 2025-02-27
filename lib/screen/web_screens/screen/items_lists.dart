import 'package:cem/screen/web_screens/screen/bid_release_finalpage.dart';
import 'package:flutter/material.dart';

class ItemsListsPage extends StatefulWidget {
  const ItemsListsPage({super.key});

  @override
  State<ItemsListsPage> createState() => _ItemsListsPageState();
}

class _ItemsListsPageState extends State<ItemsListsPage> {
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<Map<String, dynamic>> listOfItems = [];

  void _addToList() {
    Map<String, dynamic> data = {
      'goods': _controllers.first.text,
      'quantity': _controllers[1].text,
      'specifications': _controllers[2].text,
      'deliverytime': _controllers[3].text,
    };
    listOfItems.add(data);
    _controllers.first.clear();
    _controllers[1].clear();
    _controllers[2].clear();
    _controllers[3].clear();
    setState(() {});
  }
// update////////////////////////////////////////////////////////

  void _showUpdateDialog(int index) {
    // Create temporary controllers with existing values
    TextEditingController goodsController =
        TextEditingController(text: listOfItems[index]['goods']);
    TextEditingController quantityController =
        TextEditingController(text: listOfItems[index]['quantity']);
    TextEditingController specificationsController =
        TextEditingController(text: listOfItems[index]['specifications']);
    TextEditingController deliveryTimeController =
        TextEditingController(text: listOfItems[index]['deliverytime']);

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
                listOfItems[index] = {
                  'goods': goodsController.text,
                  'quantity': quantityController.text,
                  'specifications': specificationsController.text,
                  'deliverytime': deliveryTimeController.text,
                };
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _controllers[0],
                      decoration: const InputDecoration(
                        labelText: 'Goods',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0), // Bold black outline
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controllers[1],
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0), // Bold black outline
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      controller: _controllers[2],
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Specifications',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0), // Bold black outline
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextFormField(
                      controller: _controllers[3],
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Delivery Time',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0), // Bold black outline
                        ),
                      ),
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
                              listOfItems[index]["goods"],
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
                              listOfItems[index]["quantity"],
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listOfItems[index]["specifications"],
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listOfItems[index]["deliverytime"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 9, 9),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: IconButton(
                          //     onPressed: () {
                          //       listOfItems.removeAt(index);
                          //       setState(() {});
                          //     },
                          //     icon: const Icon(Icons.remove),
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BidSubmissionfinalPage()),
                        );
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

   // for (int i = 0; i < _controllers.length; i++)
            //   TextField(
            //     controller: _controllers[i],
            //     decoration: InputDecoration(
            //       labelText: 'Item ${i + 1}',
            //     ),
            //   ),