import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomMainButton extends StatelessWidget {
  final Color color;
  final Widget child;
  double? borderRadius;
  final Function() onTap;
  double? height ;
  double? elevation ;
  Color? borderColor;


  CustomMainButton({super.key, required this.color,  this.borderRadius, required this.onTap, required this.child,this.height,this.elevation, this.borderColor,});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: elevation,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
        ),
        color: color,
        height:height??6.h,
        child: child,
        onPressed: (){
          onTap();
        });
  }
}
