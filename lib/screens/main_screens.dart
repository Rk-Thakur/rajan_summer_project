import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
          centerTitle: true,
          backgroundColor: Colors.red,
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

            // ClipPath(
            //   clipper: WaveClipperOne(),
            //   child: Container(
            //     height: 200,
            //     width: 500,
            //     color: Colors.red,
            //     child: Center(
            //         child: Text(
            //       "DashBoard",
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //           letterSpacing: 7),
            //     )),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Consumer(
                  builder: (context, ref, child) {
                    final description = ref.watch(logSignProvider);
                    final users = ref.watch(logSignProvider);
                    return Column(
                      //mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                            height: 400,
                            decoration: BoxDecoration(),
                            child: Text(
                              "A gym is a place where people go to train and exercise, but also to unwind, socialize, and recharge. Therefore, a good gym is a facility that promotes physical activity, provides a safe, functional, and comfortable workout environment, and creates a pleasant and enjoyable atmosphere for recreation and socialization.So, what makes a great gym? The practicality and flexibility of its design, the quality of the equipment, the safety and comfort of the gym environment, the availability of modern amenities, the aesthetic appeal of the facility, the proper maintenance of the premises, the competence and friendly attitude of the staff members? All of these factors – and many others – contribute to the “greatness” of a gym, motivate people to exercise harder, and make them want to come back to the facility.",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                            // child: Table(
                            //   border: TableBorder.all(),
                            //   children: [
                            //     TableRow(children: [
                            //       Text(
                            //         "Calories",
                            //         style: TextStyle(fontWeight: FontWeight.bold),
                            //       ),
                            //       Text("Bulking",
                            //           style:
                            //               TextStyle(fontWeight: FontWeight.bold)),
                            //       Text("Cutting",
                            //           style:
                            //               TextStyle(fontWeight: FontWeight.bold)),
                            //     ])
                            //   ],
                            // ),
                            ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
