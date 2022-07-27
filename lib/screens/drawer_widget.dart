import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/auth_provider.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/providers/login_provider.dart';
import 'package:summer_project/screens/main_screens.dart';
import 'package:summer_project/screens/tournamentfixtures.dart';
import 'package:summer_project/screens/tournamentgroups.dart';
import 'package:summer_project/screens/tournaments.dart';
import 'package:summer_project/screens/tournamentteams.dart';

class drawer_widget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStream);
    return SafeArea(
      child: user.when(
          data: (data) {
            return Drawer(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DrawerHeader(
                      padding: EdgeInsets.only(top: 120),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black45,
                          image: DecorationImage(
                              opacity: .5,
                              image: NetworkImage(data.customerImage),
                              fit: BoxFit.cover)),
                      child: Center(
                        child: Text(
                          data.cusomtername,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(() => Home(), transition: Transition.fadeIn);
                    },
                    leading: Icon(
                      Icons.home,
                      size: 40,
                    ),
                    title: Text("Home"),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.to(() => Tournaments(),
                          transition: Transition.fadeIn);
                    },
                    title: Text("Tournaments"),
                    leading: Icon(
                      Icons.sports_soccer,
                      size: 40,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.to(() => tournamentTeams(),
                          transition: Transition.leftToRightWithFade);
                    },
                    title: Text("Tournament Teams"),
                    leading: Icon(
                      Icons.list,
                      size: 40,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.to(() => tournamentGroups(),
                          transition: Transition.circularReveal);
                    },
                    title: Text("Groups"),
                    leading: Icon(
                      Icons.group,
                      size: 40,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.to(() => tournamentFixtures(),
                          transition: Transition.leftToRightWithFade);
                    },
                    title: Text("Tournament Fixtures"),
                    leading: Icon(
                      Icons.table_chart,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(logSignProvider).LogOut();
                      // ref.refresh(loadingProvider.notifier);
                      // ref.refresh(loadingProvider);
                    },
                    leading: Icon(
                      Icons.exit_to_app,
                      size: 30,
                    ),
                    title: Text("Logout"),
                  )
                ],
              ),
            );
          },
          error: (err, stack) => Text('$err'),
          loading: () => Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )),
    );
  }
}
