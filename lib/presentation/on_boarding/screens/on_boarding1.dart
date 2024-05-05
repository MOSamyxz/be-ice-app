import 'package:BeIce/core/constants/images.dart';
import 'package:BeIce/core/theme/colors.dart';
import 'package:BeIce/presentation/on_boarding/screens/on_boarding2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<Offset> slideTextAnimation;
  late Animation<double> fadeAnimation;

  double bottom = -100;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(-5, 0), end: const Offset(2.59, 0))
            .animate(controller);
    slideTextAnimation =
        Tween<Offset>(begin: const Offset(5, 0), end: const Offset(0.35, 0))
            .animate(controller);
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    bottom = -5.h;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient:
                    RadialGradient(radius: 0.7, focalRadius: 0.5, colors: [
              AppColors.lighterPinkColor.withOpacity(0.9),
              AppColors.pinkColor,
            ])),
          ),
          AnimatedBuilder(
              animation: fadeAnimation,
              builder: (context, _) {
                return FadeTransition(
                  opacity: fadeAnimation,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 140.h,
                          child: Image.asset(
                            AppImages.pOne,
                            scale: 2.5,
                          )),
                      Positioned(
                          top: 500.h,
                          left: 270.w,
                          child: Image.asset(
                            AppImages.pThree,
                            scale: 9,
                          )),
                    ],
                  ),
                );
              }),
          AnimatedBuilder(
              animation: slideTextAnimation,
              builder: (context, _) {
                return Positioned(
                  top: 60.h,
                  child: SlideTransition(
                    position: slideTextAnimation,
                    child: RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'أنواع عديدة ومختلفة من',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: '\nالأيس كريم',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                  ),
                );
              }),
          AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, _) {
              return AnimatedPositioned(
                bottom: bottom,
                left: -0.w,
                duration: const Duration(milliseconds: 500),
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: ScaleTransition(
                      alignment: Alignment.bottomCenter,
                      scale: scaleAnimation,
                      child: Center(
                        child: Image.asset(
                          AppImages.onBoardingOne,
                          scale: 0.9,
                        ),
                      )),
                ),
              );
            },
          ),
          AnimatedBuilder(
              animation: slideAnimation,
              builder: (context, _) {
                return Positioned(
                  top: 170.h,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.3), // Shadow color
                              spreadRadius: 0.001, // Spread radius
                              blurRadius: 15, // Blur radius
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingTwo()));
                          },
                          child: Image.asset(
                            AppImages.onBoardingButtonOne,
                            height: 80.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
