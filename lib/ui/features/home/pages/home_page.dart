import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';
import 'package:radio_app/ui/features/home/widgets/home_page_layout_success.dart';
import 'package:radio_app/ui/widgets/loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeCubit>()..getRadioStations(),
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
          case HomeStatus.loading:
            return const CustomLoader();

          case HomeStatus.success:
            return HomePageLayoutSuccess(
              radioList: state.radioList,
            );

          case HomeStatus.error:
            return const Center(
              child: Text('Something went wrong'),
            );
        }
      },
    );
  }
}
