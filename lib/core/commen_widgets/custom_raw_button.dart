import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRawMaterialButton extends StatelessWidget {
  const CustomRawMaterialButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.color,
    this.textColor,
  });
  final void Function()? onPressed;
  final String textButton;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: RawMaterialButton(
        fillColor: color ?? Colors.blue,
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.r),
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }
}
