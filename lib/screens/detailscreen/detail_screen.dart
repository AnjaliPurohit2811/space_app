import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favouritescreen/favourite_screen.dart';

import '../model/model_data.dart';
import '../provider/space_provider.dart';


class DetailScreen extends StatefulWidget {
  final SpaceType spaceType;

  const DetailScreen({Key? key, required this.spaceType}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.spaceType.hero,
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
            'Details of ${widget.spaceType.name}',
            style: TextStyle(color: Colors.white, letterSpacing: 1),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FavouriteScreen(),
                ));
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
                return RotationTransition(
                  turns: animationController,
                  child: child,
                );
              },
              child: Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.spaceType.image),
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
                widget.spaceType.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.spaceType.description,
              style: TextStyle(color: Colors.white, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 30,),
            InkWell(
              highlightColor: Colors.black,
              onTap: () {
                final provider = context.read<SpaceProvider>();
                provider.addToFavourites(widget.spaceType);
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
                      Text('Add to Favourites', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      Icon(CupertinoIcons.heart, color: Colors.white, size: 30,),
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
