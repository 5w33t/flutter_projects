import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tong_app/presentation/constants/palette.dart';
import 'package:tong_app/providers/auth_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = AuthProvider();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/tong_exit.png'),
          Text('Another time then, ${authProvider.user.displayName!}'),
          ElevatedButton(
            child: Text(
              'Log Out',
              style: GoogleFonts.poppins().copyWith(
                color: primaryColor,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              AuthProvider().signOut();
              
            },
          ),
        ],
      ),
    );
  }
}
