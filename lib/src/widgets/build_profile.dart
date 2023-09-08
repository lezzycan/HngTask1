import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildProfile extends StatelessWidget {
  const BuildProfile({required this.icon, super.key, required this.text, required this.subTitle});
  final IconData icon;
  final String text;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: GoogleFonts.lato(fontSize: 18.sp, color: Color.fromARGB(255, 19, 1, 1)),
      ),
      subtitle: Text(
        subTitle,
         style: GoogleFonts.lato(fontSize: 14.sp, color: Color.fromARGB(255, 80, 111, 130)),
      ),
      
    );
  }
}
