import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';
import 'package:radio_app/ui/features/detail/widgets/radio_station_detail_layout_success.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';

class RadioStationDetailLayout extends StatelessWidget {
  const RadioStationDetailLayout({super.key, required this.radioStation});

  final RadioStationEntity radioStation;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RadioStationDetailCubit, RadioStationDetailState>(
      listener: (context, state) {
        if (state.status == DetailPageStatus.error) {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: CustomColors.backgroundColor,
                content: Text(
                  'Ups... it seems the url it\'s broken. Please, try again later.',
                  style:
                      CustomStyles.smallBody.copyWith(color: CustomColors.grey),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Understood',
                      style: CustomStyles.smallBody
                          .copyWith(color: CustomColors.primaryColor),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
      bloc: context.read<RadioStationDetailCubit>()..init(),
      builder: (context, state) {
        switch (state.status) {
          case DetailPageStatus.initial:
          case DetailPageStatus.loading:
          case DetailPageStatus.error:
          case DetailPageStatus.success:
            return RadioStationDetailLayoutSuccess(
              radioStation: radioStation,
            );
        }
      },
    );
  }
}
