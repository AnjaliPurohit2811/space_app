import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homescreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 110),
            child: Text(
              'EXPLORE ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 85),
            child: Text(
              'THE SPACE ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text(
              'WITH US! ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Learn about the advanced technology with us',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/img/solar.png'),
                    fit: BoxFit.cover)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: AnimatedContainer(
                curve: Curves.easeInOutBack,
                duration: Duration(seconds: 2),
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.red, Colors.orange, Colors.amber]),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
