import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/detail/pages/radio_station_detail_layout.dart';
import 'package:radio_app/ui/features/home/pages/home_page.dart';
import 'package:radio_app/ui/features/landing/pages/landing_page.dart';
import 'package:radio_app/ui/widgets/CustomScaffold.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.home:
      return MaterialPageRoute(
        builder: (context) => const CustomScaffold(
          appBarTitle: 'Home',
          child: HomePage(),
        ),
      );

    case RouteConstants.detailRadio:
      final data = settings.arguments as RadioStationEntity;
      return MaterialPageRoute(
        builder: (context) => CustomScaffold(
          appBarTitle: data.name,
          child: RadioStationDetailLayout(
            url: data.url,
          ),
        ),
      );

    case RouteConstants.landing:
      return MaterialPageRoute(builder: (context) => const LandingPage());

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
