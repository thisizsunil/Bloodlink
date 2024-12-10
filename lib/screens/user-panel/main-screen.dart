import 'package:blood_link/utils/app-constant.dart';
import 'package:blood_link/widgets/banner-widget.dart';
import 'package:blood_link/widgets/custom-drawer-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextCotor),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppConstant.appScendoryCotor,
            statusBarBrightness: Brightness.light),
        backgroundColor: AppConstant.appMainCotor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(
            color: AppConstant.appTextCotor,
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              Text("Ali"),

              //banners
              BannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
