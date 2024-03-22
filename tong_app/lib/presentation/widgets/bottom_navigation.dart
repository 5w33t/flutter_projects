import 'package:flutter/material.dart';
import 'package:tong_app/presentation/constants/palette.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.onItemChanged,
    required this.currentIndex,
  });
  final void Function(int)? onItemChanged;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white,
      onTap: onItemChanged,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.coffee,
          ),
          label: 'Adda',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
          ),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.contact_page,
          ),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.logout,
          ),
          label: 'Log Out',
        ),
      ],
    );
  }
}
