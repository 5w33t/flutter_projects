part of 'ramadan_bloc.dart';

@immutable
sealed class RamadanState {}

final class RamadanInitial extends RamadanState {}

final class RamadanLoading extends RamadanState {}

final class RamadanSuccess extends RamadanState {
  final List<RamadanTime> ramadanSchedule;
  final RamadanTime today;
  RamadanSuccess({
    required this.ramadanSchedule,
    required this.today,
  });
}

final class RamadanFailure extends RamadanState {
  final String log;

  RamadanFailure({required this.log});
}
