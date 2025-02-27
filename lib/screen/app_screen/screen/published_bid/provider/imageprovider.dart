import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

class ImageProviderClass extends ChangeNotifier {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  File? get imageFile => _imageFile;

 Future<void> pickAndUploadImage(BuildContext context) async {
    // Pick an image from the gallery
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Get the image file
      _imageFile = File(pickedFile.path);
      File imageFile = File(pickedFile.path);
       notifyListeners(); // Notify UI to update

      // Prepare the image file to upload
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-backend-url.com/upload'),  // Replace with your backend URL
      );
      var imageBytes = await imageFile.readAsBytes();
      var mimeType = lookupMimeType(imageFile.path);

      // Add the image to the request
      request.files.add(http.MultipartFile.fromBytes(
        'file', imageBytes,
        filename: basename(imageFile.path),
        contentType: MediaType.parse(mimeType ?? 'application/octet-stream'),
      ));

      // Send the request to the backend
      var response = await request.send();

      if (response.statusCode == 200) {
        // Successfully uploaded the image
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image uploaded successfully!")),
        );
      } else {
        // Failed to upload the image
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload the image.")),
        );
      }
    }
  }

  void clearImage() {
    _imageFile = null;
    notifyListeners();
  }
}
