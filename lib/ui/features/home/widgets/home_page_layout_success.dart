import 'package:flutter/material.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/home/widgets/header_description.dart';

import 'radio_card.dart';

class HomePageLayoutSuccess extends StatelessWidget {
  const HomePageLayoutSuccess({super.key, required this.radioList});

  final List<RadioStationEntity> radioList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 100,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final radioTile = radioList[index];
        return RadioCard(radio: radioTile);
      },
      separatorBuilder: (BuildContext context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
