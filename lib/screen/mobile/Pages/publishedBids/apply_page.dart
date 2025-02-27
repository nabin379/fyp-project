import 'package:cem/screen/mobile/Pages/publishedBids/view_page.dart';
import 'package:cem/screen/mobile/provider/applypage_provider.dart';
import 'package:cem/screen/mobile/provider/imageprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplyPage extends StatelessWidget {
  const ApplyPage({super.key});

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
        title: const Text(
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
                    MaterialPageRoute(builder: (context) => const ViewPage()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, // Text color
                  backgroundColor: Colors.green, // Button background color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Padding inside button
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold), // Text styling
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                child: const Text("View List")),
            const SizedBox(
              height: 20,
            ),
            Consumer<DropdownProvider>(
              builder: (context, dropdownProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ExpansionTile to show and hide the requirements
                    ExpansionTile(
                      title: const Text(
                        "Requirement List",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      leading: const Icon(Icons.list),
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
                              const Center(
                                  child:
                                      CircularProgressIndicator()), // Show loading indicator
                            ]
                          : dropdownProvider.requirements.isEmpty
                              ? [
                                  const Center(
                                      child:
                                          Text("No requirements available.")),
                                ]
                              : [
                                  ...dropdownProvider.requirements.map((item) {
                                    return ListTile(
                                      title: Text(item),
                                    );
                                  }),
                                  // Upload Photo Button at the bottom
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      onPressed: () => imageProvider
                                          .pickAndUploadImage(context),
                                      icon: const Icon(Icons.upload_file),
                                      label: const Text("Upload Photo"),
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
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text("Continue")),
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
