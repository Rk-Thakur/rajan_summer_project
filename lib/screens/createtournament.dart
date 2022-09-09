import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/auth_provider.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/providers/image_provider.dart';
import 'package:summer_project/screens/tournaments.dart';

class createTournament extends StatelessWidget {
  TextEditingController prizediscription = TextEditingController();
  TextEditingController tournamentname = TextEditingController();
  TextEditingController organizername = TextEditingController();
  TextEditingController tournamentinformation = TextEditingController();
  TextEditingController rulesandregulations = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final designStream = ref.watch(designProvider);
        final db = ref.watch(imageProvider);

        return Scaffold(
          appBar: AppBar(
            title: Text("Create Tournament"),
            centerTitle: true,
          ),
          // floatingActionButton: InkWell(
          //   onTap: () => Get.to(() => Tournaments()),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.green,
          //     child: Icon(Icons.add, color: Colors.red),
          //   ),
          // ),

          body: SafeArea(
            child: SingleChildScrollView(
                child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tournament name is Required!!';
                      }
                      return null;
                    },
                    controller: tournamentname,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 78, 206, 46),
                            width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Tournament Name',
                      prefixIcon: Icon(
                        Icons.verified_user,
                        size: 15,
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Organizer name is Required!!';
                      }
                      return null;
                    },
                    controller: organizername,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 78, 206, 46),
                            width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Organizer Name',
                      prefixIcon: Icon(
                        Icons.verified_user,
                        size: 15,
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 10,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Prize discription is Required!!';
                      }
                      return null;
                    },
                    controller: prizediscription,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 78, 206, 46),
                            width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Prize Description',
                      prefixIcon: Icon(
                        Icons.verified_user,
                        size: 15,
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 10,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tournament information is Required!!';
                      }
                      return null;
                    },
                    controller: tournamentinformation,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 78, 206, 46),
                            width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Tournament Information',
                      prefixIcon: Icon(
                        Icons.verified_user,
                        size: 15,
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 10,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Rules and Regulations is Required!!';
                      }
                      return null;
                    },
                    controller: rulesandregulations,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 78, 206, 46),
                            width: 2.0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Rules and Regulations',
                      prefixIcon: Icon(
                        Icons.verified_user,
                        size: 15,
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      _form.currentState!.save();
                      FocusScope.of(context).unfocus();
                      if (_form.currentState!.validate()) {
                        final response = await ref
                            .read(crudProvider)
                            .addtournament(
                                image: db.image!,
                                tournament_name: tournamentname.text.trim(),
                                organizer_name: organizername.text.trim(),
                                prize_description: prizediscription.text,
                                tournament_information:
                                    tournamentinformation.text,
                                rules_regulation: rulesandregulations.text);
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
                          "Add Tournament",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            )),
          ),
        );
      },
    );
  }
}
