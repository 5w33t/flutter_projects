import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tong_app/presentation/constants/palette.dart';
import 'package:tong_app/presentation/screens/home_screen.dart';
import 'package:tong_app/providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthProvider _authProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'T  O  N  G\nUNLIMITED ADDA',
              style: GoogleFonts.poppins().copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/tong_login.png',
              height: 400,
            ),
            ElevatedButton.icon(
              icon: Image.asset(
                'assets/images/google.png',
                height: 30,
              ),
              onPressed: () async {
                bool result = await _authProvider.signInWithGoogle(context);
                if (result && context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                minimumSize: const Size(double.infinity - 20, 40),
              ),
              label: Text(
                'Log In with Google',
                style: GoogleFonts.poppins().copyWith(
                  color: primaryColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
