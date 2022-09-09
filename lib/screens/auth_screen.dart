import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/login_provider.dart';
import 'package:summer_project/screens/drawer_widget.dart';

import '../providers/auth_provider.dart';
import '../providers/image_provider.dart';

class AuthScreen extends StatelessWidget {
  final customerNameController = TextEditingController();
  final customermailController = TextEditingController();
  final customerpassController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer_widget(),
        body: SafeArea(
          child: Consumer(builder: (context, ref, child) {
            final isLogin = ref.watch(loginProvider);
            final db = ref.watch(imageProvider);
            final isLoading = ref.watch(loadingProvider);
            return SingleChildScrollView(
              child: Form(
                key: _form,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          isLogin ? 'Healthy Futsal' : 'Sign Up',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          isLogin
                              ? 'Futsal Tournament Application'
                              : 'Fill Up Your Credentials',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                          'assets/image/front.jpg',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      if (!isLogin)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            controller: customerNameController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0)),
                                hintText: 'Username',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      if (!isLogin)
                        InkWell(
                          onTap: () {
                            ref.read(imageProvider).getImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 200,
                              child: db.image == null
                                  ? Center(
                                      child: Text('please select an image'),
                                    )
                                  : Image.file(
                                      File(db.image!.path),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: customermailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: customerpassController,
                          obscureText: true,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            _form.currentState!.save();
                            ref.read(loadingProvider.notifier).toogle();
                            FocusScope.of(context).unfocus();
                            if (isLogin) {
                              final response = ref.read(logSignProvider).Login(
                                  email: customermailController.text.trim(),
                                  password: customerpassController.text.trim());

                              if (response != 'success') {
                                ref.read(loadingProvider.notifier).toogle();

                                Get.showSnackbar(GetSnackBar(
                                  title: 'Got some error',
                                  duration: Duration(seconds: 1),
                                  message: 'Check the password',
                                ));
                              }
                            } else {
                              if (db.image == null) {
                                Get.defaultDialog(
                                    title: 'please provide an image',
                                    content: Text('image must be select'));
                              } else {
                                ref.read(logSignProvider).signUp(
                                    customerName:
                                        customerNameController.text.trim(),
                                    email: customermailController.text.trim(),
                                    password:
                                        customerpassController.text.trim(),
                                    image: db.image!);
                              }
                            }
                          },
                          child: isLoading
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Is Loading please wait',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                )
                              : Text(
                                  isLogin ? 'Login' : 'Sign up',
                                  style: TextStyle(fontSize: 20),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                if (customermailController.text.isNotEmpty) {
                                  ref.read(logSignProvider).ResetPassword(
                                      customermailController.text.trim());
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'Email not provided',
                                    duration: Duration(seconds: 1),
                                    message: 'Please Provide the email',
                                  ));
                                }
                              },
                              child: Text(isLogin ? 'Forget Password' : '')),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(isLogin
                              ? 'Don\'t have an account?'
                              : 'Already have an account'),
                          TextButton(
                              onPressed: () {
                                ref.read(loginProvider.notifier).toogle();
                              },
                              child: Text(isLogin ? 'SignUp' : 'Login')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
