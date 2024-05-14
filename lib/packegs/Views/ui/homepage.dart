import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_project2024/packegs/Views/shared/appstyle.dart';
import 'package:travel_project2024/packegs/Views/shared/home_widget.dart';
import 'package:travel_project2024/packegs/models/sneaker_model.dart';
import 'package:travel_project2024/packegs/services/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 1, vsync: this);

  late Future<List<Sneakers>> _package;

  void getpackage() {
    _package = Helper().getPackageSneakers();
  }

  @override
  void initState() {
    super.initState();
    getpackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 9, right: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // profile start
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          'Hello! \nWelcome Travel Hub',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Badge(
                        label: Text("1"),
                        child: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage(
                              'images/icon/message.png',
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Badge(
                        label: Text("9+"),
                        child: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('images/icon/noti.png')),
                      ),
                    ],
                  ),
                  // profile end

                  SizedBox(
                    height: 15,
                  ),
                  //Add Player start
                  SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0),
                        itemCount: demoadd_play.length,
                        itemBuilder: (context, index) {
                          return addplay(demoadd_play[index]);
                        }),
                  ),
                  //add player end

                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 500,
                    child: Stack(
                      children: [
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelStyle:
                            appstyle(24, Colors.white, FontWeight.bold),
                            unselectedLabelColor:
                            Colors.black54.withOpacity(0.3),
                            tabs: const [
                              Tab(
                                text: 'Srilanaka',
                              ),
                            ]),
                        Padding(
                          padding: EdgeInsets.only(
                              top:
                              MediaQuery.of(context).size.height * 0.1),
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                HomeWidget(
                                  threeday: _package,
                                  tabIndex: 0,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding addplay(add_play Add_play) {
    return Padding(
      padding:  EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          height: 170,
          width: 390,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 390,
                  child: ImageChanger(images: Add_play.images,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageChanger extends StatefulWidget {
  final List<String> images;

  const ImageChanger({Key? key, required this.images}) : super(key: key);

  @override
  _ImageChangerState createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentIndex < widget.images.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.images[_currentIndex]);
  }
}

class add_play {
  final List<String> images;

  add_play({
    required this.images,
  });
}

List<add_play> demoadd_play = [
  add_play(
    images: ['images/image/add1.jpg', 'images/image/add2.jpg','images/image/add3.jpg', 'images/image/add4.jpg'],
  ),
];
