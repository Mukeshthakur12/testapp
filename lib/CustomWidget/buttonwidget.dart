import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String svgImagePath;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final bool isleft;

  const CustomButton({
    required this.svgImagePath,
    required this.label,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderRadius,
    required this.textStyle,
    required this.onPressed,
    this.isleft=false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor,
          width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isleft?SizedBox.shrink():SvgPicture.asset(
            svgImagePath,
            width: 18,
            height: 15,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: textStyle,
          ),
          SizedBox(width: 8),

          isleft?SvgPicture.asset(
            svgImagePath,
            width: 18,
            height: 15,
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}
