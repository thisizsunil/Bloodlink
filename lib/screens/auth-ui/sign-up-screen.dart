import 'package:blood_link/controllers/sign-up-controller.dart';
import 'package:blood_link/screens/auth-ui/sign-in-screen.dart';
import 'package:blood_link/utils/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryCotor,
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: TextStyle(color: AppConstant.appTextCotor),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: Get.height / 20),
                Container(
                    alignment: Alignment.center,
                    child: Text("Welcome to my app",
                        style: TextStyle(
                            color: AppConstant.appScendoryCotor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0))),
                SizedBox(height: Get.height / 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appScendoryCotor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: username,
                      cursorColor: AppConstant.appScendoryCotor,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "UserName",
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userPhone,
                      cursorColor: AppConstant.appScendoryCotor,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userCity,
                      cursorColor: AppConstant.appScendoryCotor,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          hintText: "City",
                          prefixIcon: Icon(Icons.location_pin),
                          contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => TextFormField(
                          obscureText: signUpController.isPasswordVisible.value,
                          controller: userPassword,
                          cursorColor: AppConstant.appScendoryCotor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  signUpController.isPasswordVisible.toggle();
                                },
                                child: signUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility_off),
                              ),
                              contentPadding:
                                  EdgeInsets.only(top: 2.0, left: 8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height / 25,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2.5,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                        color: AppConstant.appScendoryCotor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextButton(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: AppConstant.appTextCotor),
                      ),
                      onPressed: () async {
                        String name = username.text.trim();
                        String email = userEmail.text.trim();
                        String phone = userPhone.text.trim();
                        String city = userCity.text.trim();
                        String password = userPassword.text.trim();
                        String userDeviceToken = '';

                        if (name.isEmpty ||
                            email.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty ||
                            password.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please enter all details",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryCotor,
                            colorText: AppConstant.appTextCotor,
                          );
                        } else {
                          UserCredential? userCredential =
                              await signUpController.signUpMethod(name, email,
                                  phone, city, password, userDeviceToken);
                          if (userCredential != null) {
                            Get.snackbar(
                              "Varification email sent.",
                              "Please check your email.",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryCotor,
                              colorText: AppConstant.appTextCotor,
                            );
                            //  signout  for when user first sign up the user data go to firestore database 
                             
                            FirebaseAuth.instance.signOut();
                            Get.offAll(()=> SignInScreen());
                            

                          }
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: AppConstant.appScendoryCotor),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignInScreen()),
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                            color: AppConstant.appScendoryCotor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
