import 'dart:io';

import 'package:cem/screen/app_screen/screen/published_bid/provider/apply_provider.dart';
import 'package:cem/screen/app_screen/screen/published_bid/provider/imageprovider.dart';
import 'package:cem/screen/app_screen/screen/published_bid/view_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ApplyPage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  ApplyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final imageProvider = Provider.of<ImageProviderClass>(context);
    // Fetch data on first build (you can replace this with actual API call later)
    Future.microtask(() {
      if (Provider.of<DropdownProvider>(context, listen: false)
          .requirements
          .isEmpty) {
        Provider.of<DropdownProvider>(context, listen: false).fetchData();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "APPLY",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewPage()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Text color
                  backgroundColor: Colors.green, // Button background color
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Padding inside button
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold), // Text styling
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                child: Text("View List")),
            SizedBox(
              height: 20,
            ),
            Consumer<DropdownProvider>(
              builder: (context, dropdownProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ExpansionTile to show and hide the requirements
                    ExpansionTile(
                      title: Text(
                        "Requirement List",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(Icons.list),
                      trailing: Icon(
                        dropdownProvider.isExpanded
                            ? Icons.arrow_drop_up // Show up arrow if expanded
                            : Icons
                                .arrow_drop_down, // Show down arrow if collapsed
                      ),
                      onExpansionChanged: (expanded) {
                        // Fetch the data when the ExpansionTile is expanded
                        if (expanded && dropdownProvider.requirements.isEmpty) {
                          dropdownProvider.fetchData();
                        }
                        dropdownProvider
                            .toggleDropdown(); // Toggle the dropdown expansion state
                      },
                      children: dropdownProvider.isLoading
                          ? [
                              Center(
                                  child:
                                      CircularProgressIndicator()), // Show loading indicator
                            ]
                          : dropdownProvider.requirements.isEmpty
                              ? [
                                  Center(
                                      child:
                                          Text("No requirements available.")),
                                ]
                              : [
                                  ...dropdownProvider.requirements.map((item) {
                                    return ListTile(
                                      title: Text(item),
                                    );
                                  }).toList(),
                                  // Upload Photo Button at the bottom
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      onPressed: () => imageProvider.pickAndUploadImage(context),
                                      icon: Icon(Icons.upload_file),
                                      label: Text("Upload Photo"),
                                    ),
                                  ),

                                  // Display Selected Image
                                  if (imageProvider.imageFile != null)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.file(
                                        imageProvider.imageFile!,
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                    ),

                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, // Text color
                          backgroundColor:
                              Colors.green, // Button background color
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15), // Padding inside button
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold), // Text styling
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(4), // Rounded corners
                          ),
                        ),
                        child: Text("Continue")),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  


}
