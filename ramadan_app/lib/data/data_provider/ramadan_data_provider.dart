import 'package:flutter/services.dart';

class RamadanDataProvider {
  Future<String> getCurrentSchedule() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/ramadan_time.json');

      return response;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}

// for (var item in data['items']) {
    //   final RamadanTime ramadanTime = RamadanTime.fromMap(item);
    //   print(ramadanTime);
    // }
