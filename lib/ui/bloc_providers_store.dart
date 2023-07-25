import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';
import 'package:radio_app/ui/features/landing/cubit/landing_cubit.dart';

class BlocProviderStore {
  static MultiBlocProvider init({required Widget child}) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(
        create: (context) => GetIt.I<HomeCubit>(),
      ),
      BlocProvider(
        create: (context) => GetIt.I<LandingCubit>(),
      ),
    ], child: child);
  }
}
