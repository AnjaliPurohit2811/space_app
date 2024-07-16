import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/favouritescreen/favourite_screen.dart';
import 'package:space_app/screens/model/model_data.dart';

import '../detailscreen/detail_screen.dart';
import '../provider/space_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late AnimationController animationController;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..repeat();
  }

  Widget build(BuildContext context) {
    SpaceProvider spaceProviderT = Provider.of(context, listen: true);
    SpaceProvider spaceProviderF = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Hello! Adom',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        actions: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:eco%2Cw_1200/MTk4MDQzMTI5NzY3NTM1ODA2/short-captions-for-profile-pictures.png"),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: FutureBuilder(
          future: rootBundle.loadString('assets/json/json_data.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> data = jsonDecode(snapshot.data!);
              spaceProviderF.convert(data);
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color(0xff171717),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            CupertinoIcons.search,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Search Anything...',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteScreen(),));
                            },
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff8F54FA)),
                              child: Icon(
                                CupertinoIcons.bookmark,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Popular Now 🔥',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          child: InkWell(
                            highlightColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ));
                            },
                            child: Hero(
                              tag: 'hero',
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left: 20),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color(0xff1A1B1D),
                                          borderRadius: BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 20),
                                                child: Text(
                                                  'Planet',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 130),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      CupertinoIcons.bookmark,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 110),
                                            child: Text(
                                              'The Earth',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 40),
                                            child: Text(
                                              'The basic knowledge of the Earth',
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                      return  RotationTransition(
                                          turns: animationController,
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    AssetImage('asset/img/earth.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            highlightColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ));
                            },
                            child: Hero(
                              tag: 'hero',
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left: 20),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color(0xff1A1B1D),
                                          borderRadius: BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 20),
                                                child: Text(
                                                  'Planet',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 130),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      CupertinoIcons.bookmark,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 110),
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              '  The Jupiter',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 40),
                                            child: Text(
                                              'The basic knowledge of the Jupiter',
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                        return  RotationTransition(
                                          turns: animationController,
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                AssetImage('asset/img/jupiter.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            highlightColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ));
                            },
                            child: Hero(
                              tag: 'hero',
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left: 20),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color(0xff1A1B1D),
                                          borderRadius: BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 20),
                                                child: Text(
                                                  'Planet',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 130),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      CupertinoIcons.bookmark,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 110),
                                            child: Text(
                                              'The Saturn',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 40),
                                            child: Text(
                                              'The basic knowledge of the Saturn',
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                        return  RotationTransition(
                                          turns: animationController,
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                AssetImage('asset/img/saturn.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ), Container(
                          child: InkWell(
                            highlightColor: Colors.black,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ));
                            },
                            child: Hero(
                              tag: 'hero',
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left: 20),
                                    child: Container(
                                      height: 300,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Color(0xff1A1B1D),
                                          borderRadius: BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 20),
                                                child: Text(
                                                  'Planet',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      letterSpacing: 1.5),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 150, left: 130),
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      CupertinoIcons.bookmark,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 110),
                                            child: Text(
                                              'The Neptune',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 40),
                                            child: Text(
                                              'The basic knowledge of the Neptune',
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                        return  RotationTransition(
                                          turns: animationController,
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 350,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                AssetImage('asset/img/neptune.png'),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 180,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Color(0xff1A1B1D),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 15),
                              child: Text(
                                'Learn How To \nTravel In Space',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'You can learn about rocket \nscience here',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Color(0xff8F54FA),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Text(
                                  'Explore',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 400,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('asset/img/rocket.png'),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
