import 'package:BeIce/core/constants/images.dart';
import 'package:BeIce/core/theme/colors.dart';
import 'package:BeIce/presentation/on_boarding/screens/on_boarding1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnBoardingOne()));
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  opacity: 0.7,
                  image: AssetImage(AppImages.icePattern)),
              gradient: RadialGradient(radius: 0.7, focalRadius: 0.5, colors: [
                AppColors.whiteColor.withOpacity(0.8),
                AppColors.blueColor,
              ])),
        ),
      ),
    );
  }
}
