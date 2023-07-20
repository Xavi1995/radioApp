import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';

class RadioStationDetailLayoutSuccess extends StatefulWidget {
  const RadioStationDetailLayoutSuccess({super.key, required this.url});
  final String url;

  @override
  State<RadioStationDetailLayoutSuccess> createState() =>
      _RadioStationDetailLayoutSuccessState();
}

class _RadioStationDetailLayoutSuccessState
    extends State<RadioStationDetailLayoutSuccess> {
  @override
  Widget build(BuildContext context) {
    final detailCubit = context.read<RadioStationDetailCubit>();
    return Row(
      children: [
        TextButton(
          child: const Text('Dale al play'),
          onPressed: () {
            detailCubit.playRadio(widget.url);
          },
        ),
        TextButton(
          child: const Text('Dale al pause'),
          onPressed: () {
            detailCubit.pauseRadio();
          },
        ),
        TextButton(
          child: const Text('Dale al stop'),
          onPressed: () {
            detailCubit.stopRadio();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    final detailCubit = context.read<RadioStationDetailCubit>();
    detailCubit.disposeAudioPlayer;
    super.dispose();
  }
}
