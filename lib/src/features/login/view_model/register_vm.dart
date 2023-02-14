import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final registerVM = ChangeNotifierProvider((ref) => RegisterVM());

class RegisterVM extends ChangeNotifier {
  File? file;
  CameraDevice? device;
  final ImagePicker picker = ImagePicker();




  void gallery(BuildContext context) async{
    Navigator.of(context).pop();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      file = File(image.path);
    }
    notifyListeners();
  }

  void camera(BuildContext context) async {
    Navigator.of(context).pop();
    final XFile? cameraImg = await picker.pickImage(source: ImageSource.camera);
    if(cameraImg != null){
      file = File(cameraImg.path);
    }
    notifyListeners();
  }

  void clear()async {
    file = null;
    notifyListeners();
  }

  void closePage(BuildContext context) {
    Navigator.pop(context);
  }
}