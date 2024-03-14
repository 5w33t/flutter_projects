import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_assistant_app/home_screen.dart';

void main() {
  runApp(const AuraApp());
}

class AuraApp extends StatelessWidget {
  const AuraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Assistant',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.lime.shade100,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.limeAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
