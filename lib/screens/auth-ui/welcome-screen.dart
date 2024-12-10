// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blood_link/controllers/googel-sign-in-controller.dart';
import 'package:blood_link/screens/auth-ui/sign-in-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColor,
        title: Text("Welcome to Blood Link",
        style: TextStyle(color: AppConstant.appTextColor),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/Animation - 1733809366828.json'),
            ),
            // Container(
            //     margin: EdgeInsets.only(top: 20.0),
            //     child: Text(
            //       "Blood Link",
            //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            //     )),
            SizedBox(
              height: Get.height / 9,
            ),
            // Material(
            //   child: Container(
            //     width: Get.width / 1.6,
            //     height: Get.height / 12,
            //     decoration: BoxDecoration(
            //         color: AppConstant.appScendoryCotor,
            //         borderRadius: BorderRadius.circular(20.0)),
            //     child: TextButton.icon(
            //       icon: Image.asset(
            //         'assets/images/google.png',
            //         width: Get.width / 12,
            //         height: Get.height / 12,
            //       ),
            //       label: Text(
            //         "Sign in with google",
            //         style: TextStyle(color: AppConstant.appTextCotor),
            //       ),
            //       onPressed: () {
            //         _googleSignInController.signInWithGoogle();
            //       },
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: Get.height / 45,
            // ),
            Material(
              child: Container(
                width: Get.width / 1.6,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScendoryColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton.icon(
                    icon: Image.asset(
                      'assets/images/gmail.png',
                      width: Get.width / 12,
                      height: Get.height / 12,
                    ),
                    label: Text(
                      "Sign in with email",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      Get.off(()=> SignInScreen());
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
