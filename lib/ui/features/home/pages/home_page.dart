import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';
import 'package:radio_app/ui/features/home/widgets/header_description.dart';
import 'package:radio_app/ui/features/home/widgets/home_page_layout_success.dart';
import 'package:radio_app/ui/features/home/widgets/home_page_loading_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const HeaderDescription(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            bloc: context.read<HomeCubit>()..getRadioStations(),
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.initial:
                case HomeStatus.loading:
                  return const HomePageLoadingLayout();

                case HomeStatus.success:
                  // return const HomePageLoadingLayout();
                  return HomePageLayoutSuccess(
                    radioList: state.radioList,
                  );

                case HomeStatus.error:
                  return const Center(
                    child: Text('Something went wrong'),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
