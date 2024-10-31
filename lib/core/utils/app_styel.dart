

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';

class AppLightStyles{
  static TextStyle ?appBarTextStyle=GoogleFonts.poppins(
    fontSize: 22,fontWeight: FontWeight.w700,color:ColorsManager.white
  );
  static TextStyle ?bottomSheetTitle=GoogleFonts.poppins(
      fontSize: 18,fontWeight: FontWeight.w700,color:ColorsManager.black
  );
  static TextStyle ?hintStyle=GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.w400,color:ColorsManager.hint
  );
  static TextStyle ?dateLabel=GoogleFonts.inter(
      fontSize: 18,fontWeight: FontWeight.w400,color:ColorsManager.black
  );
  static TextStyle ?dateStyle=GoogleFonts.inter(
      fontSize: 16,fontWeight: FontWeight.w400,color:ColorsManager.grey
  );
  static TextStyle ?taskTitle=GoogleFonts.poppins(
      fontWeight:FontWeight.w700,fontSize: 18,color: ColorsManager.blue
  );
  static TextStyle ?taskDesc=GoogleFonts.poppins(
      fontWeight:FontWeight.normal,fontSize: 14,color: ColorsManager.black
  );
  static TextStyle ?taskDate=GoogleFonts.roboto(
      fontWeight:FontWeight.normal,fontSize: 12,color: ColorsManager.black
  );



}


