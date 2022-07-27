import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/auth_provider.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/screens/tournamentdetails.dart';
import 'package:summer_project/screens/tournamentfixtures.dart';

import 'createtournament.dart';

class Tournaments extends StatelessWidget {
  const Tournaments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tournamentStream = ref.watch(tournamentProvider);
        final user = ref.watch(userStream);
        return user.when(
            data: (data) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Tournaments"),
                  centerTitle: true,
                ),
                floatingActionButton:
                    data.customerId == "vFnUgAEPTmbRRYR3z6FMiXn0IK63"
                        ? InkWell(
                            onTap: () => Get.to(() => createTournament()),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.add, color: Colors.red),
                            ),
                          )
                        : null,
                body: SafeArea(
                    child: Container(
                  child: tournamentStream.when(
                      data: (data) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final dat = data[index];
                              return InkWell(
                                onTap: () {
                                  Get.to(() => tournamentdetails(
                                      tournament_image: dat.tournament_image,
                                      organizer_name: dat.organizer_name,
                                      prize_description: dat.prize_description,
                                      rules_regulation: dat.rules_regulation,
                                      tournament_id: dat.tournament_id,
                                      tournament_information:
                                          dat.tournament_information,
                                      tournament_name: dat.tournament_name));
                                },
                                child: Card(
                                  elevation: 3,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 200,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          placeholder: (context, String) {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.pink,
                                              ),
                                            );
                                          },
                                          imageUrl: dat.tournament_image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            dat.tournament_name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ]),
                                ),
                              );
                            });
                      },
                      error: (err, stack) => Text("$err"),
                      loading: () => Center(
                            child:
                                CircularProgressIndicator(color: Colors.purple),
                          )),
                )),
              );
            },
            error: (err, stack) => Text("$err"),
            loading: () => Center(
                  child: CircularProgressIndicator(color: Colors.purple),
                ));
      },
    );
  }
}
