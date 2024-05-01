import 'package:bjs_assessment/shared/resources/app_colors.dart';
import 'package:bjs_assessment/shared/resources/assets_path.dart';
import 'package:bjs_assessment/view/user_profile/user_profile.dart';
import 'package:bjs_assessment/widget/custom_assets_image.dart';
import 'package:flutter/material.dart';

import '../data/local/local_request.dart';
import 'user_profile/edit_profile.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if(LocalRequest.instance.getString(key: LocalRequest.userInfoKey).isNotEmpty){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const UserProfile()),
                (Route route) => false);
      }
      else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const EditProfile()),
                (Route route) => false);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
          child: Center(
            child: customAssetsImage(image: AssetsPath.splashLogo, fit: BoxFit.contain),
          )),
    );
  }
}
