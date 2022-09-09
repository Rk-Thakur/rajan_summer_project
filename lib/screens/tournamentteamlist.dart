import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/screens/teamsdetail.dart';

class tournamentteamlist extends StatelessWidget {
  late String tournament_name;
  tournamentteamlist({
    required this.tournament_name,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${tournament_name} Teams"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final registerStream = ref.watch(registerProvider);
          return registerStream.when(
              data: (data) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final dat = data[index];
                    return dat.tournament_name == tournament_name
                        ? InkWell(
                            onTap: () {
                              Get.to(
                                  () => teamsdetail(
                                        team_name: dat.team_name,
                                        manager_name: dat.manager_name,
                                        tournament_name: dat.tournament_name,
                                        images: dat.images,
                                        player_name: dat.playername,
                                      ),
                                  transition: Transition.fade);
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dat.team_name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container();
                  },
                );
              },
              error: (err, stack) => Text('$err'),
              loading: () => Center(
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  ));
        },
      ),
    );
  }
}

