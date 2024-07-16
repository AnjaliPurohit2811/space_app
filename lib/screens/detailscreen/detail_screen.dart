import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../favouritescreen/favourite_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin{
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
      ..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                CupertinoIcons.back,
                size: 30,
                color: Colors.white,
              )),
          title: Text(
            'Details of Planet',
            style: TextStyle(color: Colors.white, letterSpacing: 1),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavouriteScreen(),));
              },
              child: Icon(
                CupertinoIcons.bookmark,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return RotationTransition(turns: animationController , child: child,);
              },
              child: Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/img/earth.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280),
              child: Text(
                'Planet',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                'The Earth',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Our home planet Earth is a rocky, terrestrial planet.\n It has a solid and active surface with mountains,\n valleys, canyons, plains and so much more. Earth\n is special because it is an ocean planet. Water covers\n 70% of Earth's surface. ",
              style: TextStyle(color: Colors.white , fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 30,),
            InkWell(
              highlightColor: Colors.black,
              onTap: () {

              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(0xff8F54FA),
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Add to Favourites' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                      Icon(CupertinoIcons.heart , color: Colors.white, size: 30,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
