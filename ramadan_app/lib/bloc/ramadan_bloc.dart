import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/data/repository/ramadan_repository.dart';
import 'package:ramadan_app/models/ramadan_time.dart';

part 'ramadan_event.dart';
part 'ramadan_state.dart';

class RamadanBloc extends Bloc<RamadanEvent, RamadanState> {
  final RamadanRepository ramadanRepository;
  RamadanBloc(this.ramadanRepository) : super(RamadanInitial()) {
    on<RamadanFetched>((event, emit) async {
      emit(RamadanLoading());
      try {
        final schedule = await ramadanRepository.getRamadanSchedule();
        return emit(RamadanSuccess(
          ramadanSchedule: schedule,
          today: getCurrentDaySchedule(schedule),
        ));
      } on Exception catch (e) {
        emit(RamadanFailure(log: e.toString()));
      }
    });
  }

  RamadanTime getCurrentDaySchedule(List<RamadanTime> schedule) {
    final currentDate = DateUtils.dateOnly(DateTime.now());
    for (var item in schedule) {
      if (item.date.compareTo(currentDate) == 0) {
        return item;
      }
    }
    throw 'an error occured';
  }
}
