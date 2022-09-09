import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summer_project/models/fixture.dart';
import 'package:summer_project/models/group.dart';
import 'package:summer_project/models/registerteam.dart';
import 'package:summer_project/models/tournament.dart';
import 'package:summer_project/models/user.dart';
import 'package:riverpod/riverpod.dart';
import 'package:summer_project/screens/registerteam.dart';

final crudProvider = Provider.autoDispose((ref) => CrudProvider());
final tournamentProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().gettournament());
final registerProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getregteam());
final groupProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getgroup());
final fixtureProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getfixture());

class CrudProvider {
  CollectionReference dbCustomer =
      FirebaseFirestore.instance.collection('customers');
  CollectionReference dbGroup = FirebaseFirestore.instance.collection('groups');
  CollectionReference dbfixture =
      FirebaseFirestore.instance.collection('fixture');
  CollectionReference dbtournament =
      FirebaseFirestore.instance.collection('tournament');
  CollectionReference dbregisterteam =
      FirebaseFirestore.instance.collection('registerteam');

  Stream<Customer> getSingleUser() {
    final uid = auth.FirebaseAuth.instance.currentUser?.uid;
    final users = dbCustomer.where('customerId', isEqualTo: uid).snapshots();
    return users.map((event) => singleUser(event));
  }

  Customer singleUser(QuerySnapshot querySnapshot) {
    return Customer.fromJson(
        querySnapshot.docs[0].data() as Map<String, dynamic>);
  }

//register team
  Future<String> registerteam({
    required String tournament_name,
    required String team_name,
    required String manager_name,
    required XFile image,
    required String players_name,
  }) async {
    try {
      final imageId = DateTime.now().toString();

      final registerteam_id = DateTime.now().toString();
      final ref =
          FirebaseStorage.instance.ref().child('registerTeamImage/$imageId');

      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbregisterteam.add({
        'tournament_name': tournament_name,
        'registerteam_id': registerteam_id,
        'team_name': team_name,
        'manager_name': manager_name,
        'player_name': players_name,
        'image': url
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Future<String> addgroup({
    required XFile image,
    required String group_name,
  }) async {
    try {
      final imageId = DateTime.now().toString();
      final groudid = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postImage/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbGroup.add({
        'group_id': groudid,
        'group_name': group_name,
        'image': url,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Future<String> addtournament(
      {required XFile image,
      required String tournament_name,
      required String organizer_name,
      required String prize_description,
      required String tournament_information,
      required String rules_regulation}) async {
    try {
      final imageId = DateTime.now().toString();
      final tournament_id = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postImage/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbtournament.add({
        'tournament_id': tournament_id,
        'image': url,
        'tournament_name': tournament_name,
        'organizer_name': organizer_name,
        'prize_description': prize_description,
        'tournament_information': tournament_information,
        'rules_regulation': rules_regulation
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Future<String> addfixture({
    required XFile image,
    required String fixture_name,
  }) async {
    try {
      final fixtureid = DateTime.now();
      final imageId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postFixture/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbfixture.add({
        'fixture_id': fixtureid,
        'fixture_name': fixture_name,
        'image': url,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Stream<List<tournaments>> gettournament() {
    return dbtournament.snapshots().map((event) => getTournamentData(event));
  }

  List<tournaments> getTournamentData(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return tournaments(
          tournament_image: json['image'] ?? 'not available',
          organizer_name: json['organizer_name'] ?? 'not available',
          prize_description: json['prize_description'] ?? 'not available',
          rules_regulation: json['rules_regulation'] ?? 'not available',
          tournament_id: json['tournament_id'] ?? 'not null',
          tournament_information:
              json['tournament_information'] ?? 'not available',
          tournament_name: json['tournament_name'] ?? 'not available');
    }).toList();
  }

  Stream<List<group>> getgroup() {
    return dbGroup.snapshots().map((event) => getGroupdata(event));
  }

  List<group> getGroupdata(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return group(
          group_image: json['image'] ?? 'not available',
          group_name: json['group_name'] ?? 'not available');
    }).toList();
  }

  Stream<List<fixture>> getfixture() {
    return dbfixture.snapshots().map((event) => getfixturedata(event));
  }

  List<fixture> getfixturedata(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return fixture(
          fixture_image: json['image'] ?? 'not available',
          fixture_name: json['fixture_name'] ?? 'not available');
    }).toList();
  }

  Stream<List<registeredteam>> getregteam() {
    return dbregisterteam.snapshots().map((event) => getregisteredteam(event));
  }

  List<registeredteam> getregisteredteam(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return registeredteam(
          team_name: json['team_name'] ?? 'not available',
          manager_name: json['manager_name'] ?? 'not avialable',
          tournament_name: json['tournament_name'] ?? 'not avialable',
          playername: json['player_name'] ?? 'not avaibla',
          images: json['image'] ?? 'not avialbal');
    }).toList();
  }
}

final userStream =
    StreamProvider.autoDispose(((ref) => CrudProvider().getSingleUser()));
