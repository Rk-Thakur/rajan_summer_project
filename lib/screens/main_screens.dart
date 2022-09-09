import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:summer_project/providers/auth_provider.dart';
import 'package:summer_project/screens/drawer_widget.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final designDescription = TextEditingController();
  final designAmount = TextEditingController();
  final _form = GlobalKey<FormState>();
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final List<String> imageList = [
    "https://images.pexels.com/photos/3846652/pexels-photo-3846652.jpeg",
    "https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg",
    "https://images.pexels.com/photos/114296/pexels-photo-114296.jpeg",
    "https://images.pexels.com/photos/50713/football-ball-sport-soccer-50713.jpeg",
    "https://images.pexels.com/photos/102448/pexels-photo-102448.jpeg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        drawer: drawer_widget(),
        body: Column(
          children: <Widget>[
            // GFCarousel(
            //   items: imageList.map(
            //     (url) {
            //       return Container(
            //         margin: EdgeInsets.all(8.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //           child: Image.network(url,
            //               fit: BoxFit.cover, width: double.infinity),
            //         ),
            //       );
            //     },
            //   ).toList(),
            //   onPageChanged: (index) {
            //     setState(() {
            //       index;
            //     });
            //   },
            // ),
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 70,
                width: 500,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  "About Us",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Consumer(
                  builder: (context, ref, child) {
                    final description = ref.watch(logSignProvider);
                    final users = ref.watch(logSignProvider);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 320,
                          decoration: BoxDecoration(),
                          child: Text(
                            "Hello futsal enthusiasts! Welcome to Healthy Futsal’s Tournament Application. Healthy Futsal’s Tournament Application is a platform on which you can find the detail information about the tournaments that are going to take place and all relevant fixtures and groups of tournaments.",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            GFCarousel(
              items: imageList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      child: Image.network(url,
                          fit: BoxFit.cover, width: double.infinity),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
