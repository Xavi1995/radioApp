import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/detail/pages/radio_station_detail_page.dart';
import 'package:radio_app/ui/features/home/pages/home_page.dart';
import 'package:radio_app/ui/features/landing/pages/landing_page.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';
import 'package:radio_app/ui/widgets/custom_scaffold.dart';
import 'package:radio_app/ui/widgets/appbar.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.home:
      return MaterialPageRoute(
        builder: (context) => CustomScaffold(
          appBar: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              60,
            ),
            child: CustomAppBar(
              title: Text(
                'Radio App',
                style: CustomStyles.appBarTitle
                    .copyWith(color: CustomColors.primaryColor),
              ),
            ),
          ),
          child: const HomePage(),
        ),
      );

    case RouteConstants.detailRadio:
      final data = settings.arguments as RadioStationEntity;
      return MaterialPageRoute(
        builder: (context) => CustomScaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: CustomAppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: CustomColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          child: RadioStationDetailPage(
            radioStation: data,
          ),
        ),
      );

    case RouteConstants.landing:
      return MaterialPageRoute(
          builder: (context) => const CustomScaffold(
                child: LandingPage(),
              ));

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
