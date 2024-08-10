import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final List<Shadow>? shadows;

  CustomTextWidget({
    Key? key,
    required this.title,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.shadows
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        decoration: textDecoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows
      ),
    );
  }
}
