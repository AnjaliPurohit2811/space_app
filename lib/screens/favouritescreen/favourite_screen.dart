import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../detailscreen/detail_screen.dart';
import '../provider/space_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Favourite',
          style: TextStyle(color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Consumer<SpaceProvider>(
        builder: (context, provider, child) {
          return provider.favourites.isEmpty
              ? Center(
            child: Text(
              'No favourites added.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
              : ListView.builder(
            itemCount: provider.favourites.length,
            itemBuilder: (context, index) {
              final object = provider.favourites[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(spaceType: object, ),
                    ));
                  },
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
                                    padding: const EdgeInsets.only(top: 150, left: 20),
                                    child: Text(
                                      object.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 150, left: 130),
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
                                  object.name,
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
                                  object.description,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          height: 300,
                          width: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(object.image),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
