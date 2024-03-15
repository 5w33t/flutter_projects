part of 'ramadan_bloc.dart';

@immutable
sealed class RamadanEvent {}

final class RamadanFetched extends RamadanEvent {}