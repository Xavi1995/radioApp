import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/ui/features/landing/cubit/landing_cubit.dart';
import 'package:radio_app/ui/widgets/loader.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingCubit, LandingState>(
      bloc: context.read<LandingCubit>()..init(),
      listener: (context, state) {
        if (state.status.isSucces) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConstants.home, (route) => false);
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case LandingStatus.loading:
          case LandingStatus.initial:
          case LandingStatus.success:
            return const CustomLoader();
        }
      },
    );
  }
}
