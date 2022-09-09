import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:summer_project/providers/auth_provider.dart';
import 'package:summer_project/providers/crud_provider.dart';
import 'package:summer_project/screens/createfixtures.dart';

class tournamentFixtures extends StatelessWidget {
  const tournamentFixtures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final fixtureStream = ref.watch(fixtureProvider);
        final user = ref.watch(userStream);
        return user.when(
            data: (data) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Tournament Fixtures"),
                  centerTitle: true,
                ),
                floatingActionButton:
                    data.customerId == "vFnUgAEPTmbRRYR3z6FMiXn0IK63"
                        ? InkWell(
                            onTap: () => Get.to(() => createfixtures()),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add, color: Colors.black),
                            ),
                          )
                        : null,
                body: SafeArea(
                    child: Container(
                  child: fixtureStream.when(
                      data: (data) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final dat = data[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          dat.fixture_name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    ClipRRect(
                                        // borderRadius: BorderRadius.all(
                                        //     Radius.circular(20)),
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          placeholder: (context, String) {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.pink,
                                              ),
                                            );
                                          },
                                          imageUrl: dat.fixture_image,
                                          fit: BoxFit.fill,
                                        )),
                                  ],
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
