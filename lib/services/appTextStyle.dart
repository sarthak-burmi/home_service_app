import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final heading = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final subheading = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final body = GoogleFonts.poppins(fontSize: 14, color: Colors.black);
  static final small = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.grey[600],
  );
  static final nav = GoogleFonts.poppins(fontSize: 11, color: Colors.grey[700]);
  static final sectionTitle = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final cardTitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
  static final cardDesc = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.grey[700],
  );
}
