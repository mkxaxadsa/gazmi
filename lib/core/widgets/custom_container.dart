import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.radius = 24,
    this.color = Colors.white,
    this.border = false,
  });

  final double? height;
  final double radius;
  final Color color;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: border
            ? Border.all(
                color: AppColors.main,
              )
            : null,
        // gradient: const LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [],
        // ),
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColors.black,
        //     blurRadius: 10,
        //     spreadRadius: 0,
        //     offset: Offset(0, 4),
        //   ),
        // ],
        // image: const DecorationImage(
        //   image: AssetImage('assets/image.png'),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
