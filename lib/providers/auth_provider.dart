import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:summer_project/models/design.dart';
import 'package:summer_project/screens/auth_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = StreamProvider.autoDispose(
    (ref) => FirebaseAuth.instance.authStateChanges());

final designProvider = StreamProvider.autoDispose(
    (ref) => LoginSignUpProvider().getDesignDetail());

final logSignProvider = Provider.autoDispose((ref) => LoginSignUpProvider());

class LoginSignUpProvider {
  CollectionReference dbCustomer =
      FirebaseFirestore.instance.collection('customers');
  CollectionReference dbCustomerDesign =
      FirebaseFirestore.instance.collection('customersdesigndescription');
  Future<String> signUp(
      {required String email,
      required String password,
      required String customerName,
      required XFile image}) async {
    try {
      final imageFile = File(image.path);
      final imageId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('userImage/$imageId');
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      final responseUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await dbCustomer.add({
        'customername': customerName,
        'customeremail': email,
        'customerImage': url,
        'customerId': responseUser.user!.uid
      });

      return 'success';
    } on FirebaseException catch (err) {
      print(err);
      return '';
    }
  }

  Future<String> Login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseException catch (err) {
      return '${err.message}';
    }
  }

  Future<String> LogOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'success';
    } on FirebaseException catch (err) {
      print(err);
      return '';
    }
  }

  Future<void> ResetPassword(String email) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    Get.showSnackbar(GetSnackBar(
      title: 'Link sent to your link',
      duration: Duration(seconds: 1),
      message: 'Please check the mail',
    ));
    Get.to(AuthScreen());
  }

  Stream<List<design_details>> getDesignDetail() {
    return dbCustomerDesign.snapshots().map((event) => getdesigndetails(event));
  }

  List<design_details> getdesigndetails(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return design_details(
          designDescription: json['designDescription'] ?? 'not availabel',
          price: json['price '] ?? 'not availabel');
    }).toList();
  }

  Future<String> addDesignDescrption(
      {required String username,
      required String designdescription,
      required int price,
      required String userId}) async {
    try {
      await dbCustomerDesign.add({
        'username': username,
        'designDescription': designdescription,
        'price': price,
        'userId': userId
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }
}
