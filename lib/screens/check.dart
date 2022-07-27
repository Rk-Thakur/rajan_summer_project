// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:summer_project/providers/crud_provider.dart';
// import 'package:summer_project/providers/image_provider.dart';

// class registerteam extends StatefulWidget {
//   late String tournament_name;
//   registerteam({required this.tournament_name});
//   @override
//   State<registerteam> createState() => _registerteamState();
// }

// class _registerteamState extends State<registerteam> {
//   TextEditingController teamname = TextEditingController();
//   TextEditingController managername = TextEditingController();
//   TextEditingController player_name1 = TextEditingController();
//   TextEditingController player_name2 = TextEditingController();
//   TextEditingController player_name3 = TextEditingController();
//   TextEditingController player_name4 = TextEditingController();
//   TextEditingController player_name5 = TextEditingController();
//   TextEditingController player_name6 = TextEditingController();
//   TextEditingController player_name7 = TextEditingController();
//   TextEditingController player_name8 = TextEditingController();
//   final _form = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(body: Consumer(builder: (context, ref, child) {
//         final db = ref.watch(imageProvider);
//         return SingleChildScrollView(
//           child: Form(
//             key: _form,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 10, left: 10, right: 10, bottom: 0),
//                   child: Container(
//                     margin: const EdgeInsets.only(
//                         top: 10, left: 10, right: 10, bottom: 0),
//                     padding: const EdgeInsets.only(
//                         top: 10, left: 10, right: 10, bottom: 0),
//                     width: double.infinity,
//                     height: 150,
//                     //You can use EdgeInsets like above
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Team name is Required!!';
//                             }
//                             return null;
//                           },
//                           controller: teamname,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(255, 78, 206, 46),
//                                   width: 2.0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             labelText: 'Team Name',
//                             prefixIcon: Icon(
//                               Icons.verified_user,
//                               size: 15,
//                             ),
//                             alignLabelWithHint: true,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Manager name is Required!!';
//                             }
//                             return null;
//                           },
//                           controller: managername,
//                           decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: const BorderSide(
//                                   color: Color.fromARGB(255, 78, 206, 46),
//                                   width: 2.0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             labelText: 'Manager Name',
//                             prefixIcon: Icon(
//                               Icons.verified_user_rounded,
//                               size: 15,
//                             ),
//                             alignLabelWithHint: true,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 10, left: 10, right: 10, bottom: 0),
//                   child: Container(
//                     height: 480,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey,
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     ref.read(imageProvider).getImage1();
//                                   },
//                                   child: db.image1 == null
//                                       ? Container(
//                                           width: 120,
//                                           height: 100,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.red,
//                                             radius: 30,
//                                             child: Icon(
//                                               Icons.verified_user_outlined,
//                                             ),
//                                           ),
//                                         )
//                                       : Image.file(
//                                           File(db.image1!.path),
//                                           fit: BoxFit.fill,
//                                           width: 120,
//                                           height: 100,
//                                         ),
//                                 ),
//                                 Container(
//                                   width: 200,
//                                   height: 70,
//                                   child: TextFormField(
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Player1 name is Required!!';
//                                       }
//                                       return null;
//                                     },
//                                     controller: player_name1,
//                                     decoration: InputDecoration(
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                         borderSide: const BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 78, 206, 46),
//                                             width: 2.0),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                       labelText: 'Player Name',
//                                       prefixIcon: Icon(
//                                         Icons.sports_football,
//                                         size: 15,
//                                       ),
//                                       alignLabelWithHint: true,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     ref.read(imageProvider).getImage2();
//                                   },
//                                   child: db.image2 == null
//                                       ? Container(
//                                           width: 120,
//                                           height: 100,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.red,
//                                             radius: 30,
//                                             child: Icon(
//                                               Icons.verified_user_outlined,
//                                             ),
//                                           ),
//                                         )
//                                       : Image.file(
//                                           File(db.image2!.path),
//                                           fit: BoxFit.fill,
//                                           width: 120,
//                                           height: 100,
//                                         ),
//                                 ),
//                                 Container(
//                                   width: 200,
//                                   height: 70,
//                                   child: TextFormField(
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Player2 name is Required!!';
//                                       }
//                                       return null;
//                                     },
//                                     controller: player_name2,
//                                     decoration: InputDecoration(
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                         borderSide: const BorderSide(
//                                             color: Color.fromARGB(
//                                                 255, 78, 206, 46),
//                                             width: 2.0),
//                                       ),
//                                       border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                       labelText: 'Player Name',
//                                       prefixIcon: Icon(
//                                         Icons.sports_football,
//                                         size: 15,
//                                       ),
//                                       alignLabelWithHint: true,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage3();
//                           //         },
//                           //         child: db.image3 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image3!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player3 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name3,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage4();
//                           //         },
//                           //         child: db.image4 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image4!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player4 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name4,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage5();
//                           //         },
//                           //         child: db.image5 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image5!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player5 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name5,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage6();
//                           //         },
//                           //         child: db.image6 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image6!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player6 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name6,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage7();
//                           //         },
//                           //         child: db.image7 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image7!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player7 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name7,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   height: 20,
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.all(8.0),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           //     children: [
//                           //       InkWell(
//                           //         onTap: () {
//                           //           ref.read(imageProvider).getImage8();
//                           //         },
//                           //         child: db.image8 == null
//                           //             ? Container(
//                           //                 width: 120,
//                           //                 height: 100,
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(10),
//                           //                 ),
//                           //                 child: CircleAvatar(
//                           //                   backgroundColor: Colors.red,
//                           //                   radius: 30,
//                           //                   child: Icon(
//                           //                     Icons.verified_user_outlined,
//                           //                   ),
//                           //                 ),
//                           //               )
//                           //             : Image.file(
//                           //                 File(db.image8!.path),
//                           //                 fit: BoxFit.fill,
//                           //                 width: 120,
//                           //                 height: 100,
//                           //               ),
//                           //       ),
//                           //       Container(
//                           //         width: 200,
//                           //         height: 70,
//                           //         child: TextFormField(
//                           //           validator: (value) {
//                           //             if (value == null || value.isEmpty) {
//                           //               return 'Player8 name is Required!!';
//                           //             }
//                           //             return null;
//                           //           },
//                           //           controller: player_name8,
//                           //           decoration: InputDecoration(
//                           //             focusedBorder: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //               borderSide: const BorderSide(
//                           //                   color: Color.fromARGB(
//                           //                       255, 78, 206, 46),
//                           //                   width: 2.0),
//                           //             ),
//                           //             border: OutlineInputBorder(
//                           //               borderRadius: BorderRadius.circular(20),
//                           //             ),
//                           //             labelText: 'Player Name',
//                           //             prefixIcon: Icon(
//                           //               Icons.sports_football,
//                           //               size: 15,
//                           //             ),
//                           //             alignLabelWithHint: true,
//                           //           ),
//                           //         ),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 10, left: 10, right: 10, bottom: 0),
//                   child: InkWell(
//                     onTap: () async {
//                       _form.currentState!.save();
//                       FocusScope.of(context).unfocus();
//                       if (_form.currentState!.validate()) {
//                         final response =
//                             await ref.read(crudProvider).registerteam(
//                                   tournament_name: widget.tournament_name,
//                                   team_name: teamname.text.trim(),
//                                   manager_name: managername.text.trim(),
//                                   player1_image: db.image1!,
//                                   player2_image: db.image2!,
//                                   // player3_image: db.image3!,
//                                   // player4_image: db.image4!,
//                                   // player5_image: db.image5!,
//                                   // player6_image: db.image6!,
//                                   // player7_image: db.image7!,
//                                   // player8_image: db.image8!,
//                                   player1_name: player_name1.text.trim(),
//                                   player2_name: player_name2.text.trim(),
//                                   // player3_name: player_name3.text.trim(),
//                                   // player4_name: player_name4.text.trim(),
//                                   // player5_name: player_name5.text.trim(),
//                                   // player6_name: player_name6.text.trim(),
//                                   // player7_name: player_name7.text.trim(),
//                                   // player8_name: player_name8.text.trim(),
//                                 );
//                         if (response == 'success') {
//                           Navigator.pop(context);
//                         }
//                       }
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.09,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color.fromARGB(255, 155, 178, 228),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Register",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//               ],
//             ),
//           ),
//         );
//       })),
//     );
//   }
// }
