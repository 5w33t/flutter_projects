import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tong_app/presentation/constants/palette.dart';

class AddaButton extends StatelessWidget {
  const AddaButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
  });
  final void Function() onPressed;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
