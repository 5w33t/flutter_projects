import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tong_app/presentation/constants/palette.dart';
import 'package:tong_app/presentation/screens/adda_screen.dart';
import 'package:tong_app/presentation/screens/history_screen.dart';
import 'package:tong_app/presentation/screens/setting_screen.dart';
import 'package:tong_app/presentation/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex = 0;
  onItemChanged(int item) {
    setState(() {
      _selectedItemIndex = item;
    });
  }

  List<Widget> navigationScreens = [
    AddaScreen(),
    const HistoryScreen(),
    const Text('Under Construction'),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'T  O  N  G',
          style: GoogleFonts.poppins().copyWith(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigation(
        onItemChanged: onItemChanged,
        currentIndex: _selectedItemIndex,
      ),
      body: navigationScreens[_selectedItemIndex],
    );
  }
}
