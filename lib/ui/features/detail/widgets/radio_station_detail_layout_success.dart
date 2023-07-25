import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';
import 'package:radio_app/ui/features/landing/widgets/landing_loader.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';

class RadioStationDetailLayoutSuccess extends StatefulWidget {
  const RadioStationDetailLayoutSuccess(
      {super.key, required this.radioStation});
  final RadioStationEntity radioStation;

  @override
  State<RadioStationDetailLayoutSuccess> createState() =>
      _RadioStationDetailLayoutSuccessState();
}

class _RadioStationDetailLayoutSuccessState
    extends State<RadioStationDetailLayoutSuccess> {
  late RadioStationDetailCubit _radioCubit;
  @override
  void initState() {
    _radioCubit = context.read<RadioStationDetailCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.radioStation.name,
          style: CustomStyles.header.copyWith(
            color: CustomColors.lightGrey,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Image.network(
          widget.radioStation.favicon,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 80,
        ),
        BlocBuilder<RadioStationDetailCubit, RadioStationDetailState>(
            builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (state.status == DetailPageStatus.success ||
                  state.status == DetailPageStatus.initial) {
                if (state.isPlaying) {
                  _radioCubit.pauseRadio(!state.isPlaying);
                } else {
                  _radioCubit.playRadio(
                      widget.radioStation.url, !state.isPlaying);
                }
              } else {
                null;
              }
            },
            child: CircleAvatar(
              backgroundColor: CustomColors.primaryColor,
              child: SizedBox(
                width: 100,
                height: 100,
                child: state.status == DetailPageStatus.loading
                    ? const CustomLoaderMusic(
                        color: CustomColors.backgroundColor)
                    : Icon(
                        state.isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: CustomColors.backgroundColor,
                      ),
              ),
            ),
          );
        })
      ],
    );
  }

  @override
  void dispose() {
    _radioCubit.disposeAudioPlayer();
    super.dispose();
  }
}
