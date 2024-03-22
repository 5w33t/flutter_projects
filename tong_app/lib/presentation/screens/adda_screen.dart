import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tong_app/presentation/screens/join_adda_screen.dart';
import 'package:tong_app/presentation/widgets/adda_button.dart';
import 'package:tong_app/providers/adda_provider.dart';

class AddaScreen extends StatelessWidget {
  AddaScreen({
    super.key,
  });

  final AddaProvider _addaProvider = AddaProvider();
  createNewAdda() async {
    var random = Random();

    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _addaProvider.join(roomName, '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/tong_home.png',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AddaButton(
                onPressed: createNewAdda,
                icon: Icons.video_call,
                title: 'Create New Adda',
              ),
              AddaButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const JoinAddaScreen(),
                  ));
                },
                icon: Icons.add_box_rounded,
                title: 'Join Existing Adda',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
