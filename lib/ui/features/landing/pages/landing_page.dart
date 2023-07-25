import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/ui/features/landing/cubit/landing_cubit.dart';
import 'package:radio_app/ui/features/landing/widgets/landing_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingCubit, LandingState>(
      bloc: context.read<LandingCubit>()..init(),
      listener: (context, state) {
        if (state.status.isSucces) {
          context.read<LandingCubit>().goToHomePage(context);
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case LandingStatus.loading:
          case LandingStatus.initial:
          case LandingStatus.success:
            return const LandingLayout();
        }
      },
    );
  }
}
