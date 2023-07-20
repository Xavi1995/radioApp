import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/ui/features/detail/cubit/radio_station_detail_cubit.dart';
import 'package:radio_app/ui/features/detail/widgets/radio_station_detail_layout_success.dart';
import 'package:radio_app/ui/widgets/loader.dart';

class RadioStationDetailLayout extends StatelessWidget {
  const RadioStationDetailLayout({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioStationDetailCubit, RadioStationDetailState>(
      bloc: context.read<RadioStationDetailCubit>()..init(),
      builder: (context, state) {
        switch (state.status) {
          case DetailPageStatus.initial:
          case DetailPageStatus.loading:
            return const CustomLoader();
          case DetailPageStatus.success:
            return RadioStationDetailLayoutSuccess(
              url: url,
            );
          case DetailPageStatus.error:
            return const Center(child: Text('Movida'));
        }
      },
    );
  }
}
