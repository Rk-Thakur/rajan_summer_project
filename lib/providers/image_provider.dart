import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider =
    ChangeNotifierProvider.autoDispose((ref) => ImageProvider());

class ImageProvider extends ChangeNotifier {
  XFile? image;
  XFile? image1;
  XFile? image2;
  XFile? image3;
  XFile? image4;
  XFile? image5;
  XFile? image6;
  XFile? image7;
  XFile? image8;

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage1() async {
    final ImagePicker _picker = ImagePicker();
    image1 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage2() async {
    final ImagePicker _picker = ImagePicker();
    image2 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage3() async {
    final ImagePicker _picker = ImagePicker();
    image3 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage4() async {
    final ImagePicker _picker = ImagePicker();
    image4 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage5() async {
    final ImagePicker _picker = ImagePicker();
    image5 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage6() async {
    final ImagePicker _picker = ImagePicker();
    image6 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage7() async {
    final ImagePicker _picker = ImagePicker();
    image7 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> getImage8() async {
    final ImagePicker _picker = ImagePicker();
    image8 = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }
}
