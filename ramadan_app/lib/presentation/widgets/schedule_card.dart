import 'package:flutter/material.dart';
import 'package:ramadan_app/models/ramadan_time.dart';
import 'package:ramadan_app/pallete.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.schedule,
  });

  final RamadanTime schedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25).copyWith(
        topLeft: const Radius.circular(0),
        bottomRight: const Radius.circular(10),
      )),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      color: Colors.transparent,
      shadowColor: Colors.blue.shade300,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'রোজা ${schedule.serial}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  schedule.day,
                  style: const TextStyle(
                    fontSize: 14,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${schedule.tarikh} ২০২৪',
                  style: const TextStyle(
                    fontSize: 18,
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'সেহরীর শেষ সময় - ${schedule.sehri} মিনিট',
                  style: myTextStyle
                ),
                Text(
                  'ফজরের আজান - ${schedule.fazr} মিনিট',
                  style: myTextStyle
                ),
                Text(
                  'ইফতারের সময় - ${schedule.iftar} মিনিট',
                  style: myTextStyle
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
