import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tong_app/presentation/constants/palette.dart';
import 'package:tong_app/presentation/screens/home_screen.dart';
import 'package:tong_app/presentation/screens/login_screen.dart';
import 'package:tong_app/providers/auth_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TongApp());
}

class TongApp extends StatelessWidget {
  const TongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tong - Unlimited Adda',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: AuthProvider().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
