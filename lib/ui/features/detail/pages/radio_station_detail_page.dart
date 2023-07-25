import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';
import 'package:radio_app/ui/features/detail/pages/radio_station_detail_layout.dart';

class RadioStationDetailPage extends StatelessWidget {
  const RadioStationDetailPage({super.key, required this.radioStation});

  final RadioStationEntity radioStation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RadioStationDetailCubit(),
        child: RadioStationDetailLayout(
          radioStation: radioStation,
        ));
  }
}
