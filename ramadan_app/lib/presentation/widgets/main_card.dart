import 'package:flutter/material.dart';
import 'package:ramadan_app/models/ramadan_time.dart';
import 'package:ramadan_app/pallete.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.schedule,
  });
  final RamadanTime schedule;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'সেহরী ও ইফতারের সময়সূচী-২০২৪\nরাজশাহী জেলা',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorWhite,
          ),
        ),
        Text(
          'আজ ${schedule.tarikh} ২০২৪ ইং রোজ ${schedule.day}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colorWhite,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('সেহরী - ${schedule.sehri} মিনিট',
                textAlign: TextAlign.center, style: myTextStyle),
            const Text('|', style: myTextStyle),
            Text(
              'ইফতারী - ${schedule.iftar} মিনিট',
              textAlign: TextAlign.center,
              style: myTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
