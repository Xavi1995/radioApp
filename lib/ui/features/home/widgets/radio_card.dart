import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({super.key, required this.radio});

  final RadioStationEntity radio;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return GestureDetector(
      onTap: () {
        homeCubit.onTapRadio(radio, context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        child: Center(
          child: Text(radio.name),
        ),
      ),
    );
  }
}
