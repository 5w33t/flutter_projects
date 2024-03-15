// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RamadanTime {
  final String serial;
  final String tarikh;
  final DateTime date;
  final String day;
  final String sehri;
  final String fazr;
  final String iftar;
  const RamadanTime({
    required this.serial,
    required this.tarikh,
    required this.date,
    required this.day,
    required this.sehri,
    required this.fazr,
    required this.iftar,
  });

  RamadanTime copyWith({
    String? serial,
    String? tarikh,
    DateTime? date,
    String? day,
    String? sehri,
    String? fazr,
    String? iftar,
  }) {
    return RamadanTime(
      serial: serial ?? this.serial,
      tarikh: tarikh ?? this.tarikh,
      date: date ?? this.date,
      day: day ?? this.day,
      sehri: sehri ?? this.sehri,
      fazr: fazr ?? this.fazr,
      iftar: iftar ?? this.iftar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serial': serial,
      'tarikh': tarikh,
      'date': date.millisecondsSinceEpoch,
      'day': day,
      'sehri': sehri,
      'fazr': fazr,
      'iftar': iftar,
    };
  }

  factory RamadanTime.fromMap(Map<String, dynamic> map) {
    return RamadanTime(
      serial: map['serial'] as String,
      tarikh: map['tarikh'] as String,
      date: DateTime.tryParse(map['date'])!,
      day: map['day'] as String,
      sehri: map['sehri'] as String,
      fazr: map['fazr'] as String,
      iftar: map['iftar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RamadanTime.fromJson(String source) =>
      RamadanTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RamadanTime(serial: $serial, tarikh: $tarikh, date: $date, day: $day, sehri: $sehri, fazr: $fazr, iftar: $iftar)';
  }

  @override
  bool operator ==(covariant RamadanTime other) {
    if (identical(this, other)) return true;

    return other.serial == serial &&
        other.tarikh == tarikh &&
        other.date == date &&
        other.day == day &&
        other.sehri == sehri &&
        other.fazr == fazr &&
        other.iftar == iftar;
  }

  @override
  int get hashCode {
    return serial.hashCode ^
        tarikh.hashCode ^
        date.hashCode ^
        day.hashCode ^
        sehri.hashCode ^
        fazr.hashCode ^
        iftar.hashCode;
  }
}
