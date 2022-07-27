import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/providers/image_provider.dart';

class registerteam extends StatefulWidget {
  late String tournament_name;
  registerteam({required this.tournament_name});
  @override
  State<registerteam> createState() => _registerteamState();
}

class _registerteamState extends State<registerteam> {
  TextEditingController teamname = TextEditingController();
  TextEditingController managername = TextEditingController();
  TextEditingController player_name = TextEditingController();

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer(builder: (context, ref, child) {
        final db = ref.watch(imageProvider);
        return SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 0),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 0),
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Team name is Required!!';
                            }
                            return null;
                          },
                          controller: teamname,
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
                            labelText: 'Team Name',
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
                              return 'Manager name is Required!!';
                            }
                            return null;
                          },
                          controller: managername,
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
                            labelText: 'Manager Name',
                            prefixIcon: Icon(
                              Icons.verified_user_rounded,
                              size: 15,
                            ),
                            alignLabelWithHint: true,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Manager name is Required!!';
                            }
                            return null;
                          },
                          controller: player_name,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          minLines: 1,
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
                            labelText: 'Player\'s Name',
                            prefixIcon: Icon(
                              Icons.verified_user_rounded,
                              size: 15,
                            ),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 0),
                  child: InkWell(
                    onTap: () async {
                      _form.currentState!.save();
                      FocusScope.of(context).unfocus();
                      if (_form.currentState!.validate()) {
                        final response = await ref
                            .read(crudProvider)
                            .registerteam(
                                tournament_name: widget.tournament_name,
                                team_name: teamname.text.trim(),
                                manager_name: managername.text.trim(),
                                players_name: player_name.text,
                                image: db.image!);
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
                        color: Color.fromARGB(255, 155, 178, 228),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
