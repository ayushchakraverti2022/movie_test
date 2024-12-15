import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test/pages/bottom_nav.dart';
import 'package:movie_test/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      Get.offAll(BottomNav());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:  MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height, 
        child: Image.asset(
          "images/simage.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
