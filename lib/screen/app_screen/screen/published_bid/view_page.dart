import 'package:cem/screen/app_screen/screen/published_bid/provider/viewpage_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch data only once when the widget is built
    Future.microtask(
        () => Provider.of<TableViewModel>(context, listen: false).fetchData());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VIEW",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "List of Items",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<TableViewModel>(builder: (context, tableViewModel, child) {
              if (tableViewModel.isLoading) {
                return Center(
                    child: CircularProgressIndicator()); // Show loading state
              }

              if (tableViewModel.tableData.isEmpty) {
                return Center(
                    child: Text(
                        "No data available")); // Show when no data is present
              }

              return SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal, // Enables horizontal scrolling
                child: DataTable(
                  columnSpacing: 20, // Adjusts spacing between columns
                  border: TableBorder.all(), // Optional: Adds border
                  columns: [
                    DataColumn(
                        label: Text('Items',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Quantity',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Specification',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Delivery Time',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: tableViewModel.tableData.map((data) {
                    return DataRow(cells: [
                      DataCell(Text(data["Items"]!)),
                      DataCell(Text(data["Quantity"]!)),
                      DataCell(Text(data["Specification"]!)),
                      DataCell(Text(data["Delivery Time"]!)),
                    ]);
                  }).toList(),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<TableViewModel>(context, listen: false)
                    .fetchData(); // Fetch new data
              },
              child: Icon(Icons.refresh),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Requirement Lists",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "1. Umkajmm kamm mmmdddna ddddd ddd djjjd sajjj jjjj jjjsw jjjds jjd dhfdd addd dddddd sdhss ssss"),
            SizedBox(
              height: 10,
            ),
            Text(
                "2. Umkajmm kamm mmmdddna ddddd ddd djjjd sajjj jjjj jjjsw jjjds jjd dhfdd addd dddddd sdhss ssss"),
          ],
        ),
      ),
    );
  }
}
