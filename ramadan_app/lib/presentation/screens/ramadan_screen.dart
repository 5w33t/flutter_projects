import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/bloc/ramadan_bloc.dart';
import 'package:ramadan_app/presentation/widgets/main_card.dart';
import 'package:ramadan_app/presentation/widgets/schedule_card.dart';

class RamadanScreen extends StatefulWidget {
  const RamadanScreen({super.key});

  @override
  State<RamadanScreen> createState() => _RamadanScreenState();
}

class _RamadanScreenState extends State<RamadanScreen> {
  @override
  void initState() {
    context.read<RamadanBloc>().add(RamadanFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RamadanBloc, RamadanState>(
      builder: (context, state) {
        if (state is RamadanLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RamadanSuccess) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ramadan.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainCard(schedule: state.today),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.ramadanSchedule.length,
                      itemBuilder: (context, index) {
                        final schedule = state.ramadanSchedule[index];
                        return ScheduleCard(schedule: schedule);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('An error occured!'),
        );
      },
    );
  }
}
