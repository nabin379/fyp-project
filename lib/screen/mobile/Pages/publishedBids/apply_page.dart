import 'package:cem/screen/mobile/Pages/publishedBids/sucess_apply.dart';
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewPage()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text("View List"),
                ),
                const SizedBox(height: 20),

                Expanded(
                  child: SingleChildScrollView(
                    child: Consumer<DropdownProvider>(
                      builder: (context, dropdownProvider, child) {
                        return ExpansionTile(
                          title: const Text(
                            "Requirement List",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          leading: const Icon(Icons.list),
                          trailing: Icon(
                            dropdownProvider.isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                          onExpansionChanged: (expanded) {
                            if (expanded && dropdownProvider.requirements.isEmpty) {
                              dropdownProvider.fetchData();
                            }
                            dropdownProvider.toggleDropdown();
                          },
                          children: dropdownProvider.isLoading
                              ? [
                                  const Center(child: CircularProgressIndicator()),
                                ]
                              : dropdownProvider.requirements.isEmpty
                                  ? [
                                      const Center(
                                          child: Text("No requirements available.")),
                                    ]
                                  : [
                                      ...dropdownProvider.requirements
                                          .map((item) => ListTile(title: Text(item))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton.icon(
                                          onPressed: () =>
                                              imageProvider.pickAndUploadImage(context),
                                          icon: const Icon(Icons.upload_file),
                                          label: const Text("Upload Photo"),
                                        ),
                                      ),
                                      if (imageProvider.imageFile != null)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.file(
                                            imageProvider.imageFile!,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextButton(
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessApply()),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
