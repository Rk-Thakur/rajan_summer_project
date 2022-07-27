import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/crud_provider.dart';
import '../providers/image_provider.dart';

class creategroups extends StatelessWidget {
  final groupname = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: Consumer(builder: (context, ref, child) {
      final db = ref.watch(imageProvider);

      return SingleChildScrollView(
        child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, bottom: 0, right: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Groups',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(imageProvider).getImage();
                    },
                    child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: db.image == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "Please Select Image",
                                    style: TextStyle(
                                      fontSize: 15,
                                      height: 4,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            : Image.file(
                                File(db.image!.path),
                                fit: BoxFit.fill,
                              )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: groupname,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    minLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Group name  is required';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        hintText: 'Group Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      _form.currentState!.save();
                      FocusScope.of(context).unfocus();
                      if (_form.currentState!.validate()) {
                        final response = await ref.read(crudProvider).addgroup(
                              group_name: groupname.text.trim(),
                              image: db.image!,
                            );
                        if (response == 'success') {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 44, 102, 226),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    })));
  }
}
