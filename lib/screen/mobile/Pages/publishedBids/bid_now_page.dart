import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BidNowPage extends StatefulWidget {
  const BidNowPage({super.key});

  @override
  State<BidNowPage> createState() => _BidNowPageState();
}

class _BidNowPageState extends State<BidNowPage> {
  ImagePicker _picker = ImagePicker();
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Apply Now",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: const Center(
                child: Text("Image not selected"),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final XFile? photo =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  file = photo;
                });
                print("Image selected");
              },
              icon: const Icon(Icons.image,
                  color: Color.fromARGB(255, 231, 224, 224)),
              label: const Text(
                "Add Image",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(10),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
