import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_app/data/api_management/repository/model/radio_station_entity.dart';
import 'package:radio_app/ui/features/home/cubit/home_cubit.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';

class RadioCard extends StatelessWidget {
  const RadioCard({super.key, required this.radio});

  final RadioStationEntity radio;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return GestureDetector(
      onTap: () {
        homeCubit.onTapRadio(radio, context);
      },
      child: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            color: CustomColors.darkGrey,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            (radio.favicon) != ''
                ? Image.network(
                    radio.favicon,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 235,
                  child: Text(
                    radio.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomStyles.smallBody.copyWith(
                      color: CustomColors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                _getTagsWidget(radio.tags)
              ],
            ),
            const SizedBox(width: 4),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.lightGrey),
              child: const Icon(
                Icons.arrow_right_rounded,
                color: CustomColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTagsWidget(String tags) {
    List<String> tagsSplitted = [];
    tagsSplitted = tags.split(',');
    List<Widget> tagChilds = [];
    int maxLength;

    if (tagsSplitted.length > 2) {
      maxLength = 2;
    } else {
      maxLength = tagsSplitted.length;
    }

    void getTagsChilds() {
      for (int i = 0; i < maxLength; i++) {
        tagChilds.add(
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child:
                    Text(tagsSplitted[i], style: CustomStyles.extraSmallBody),
              ),
              const SizedBox(
                width: 4,
              )
            ],
          ),
        );
      }
    }

    if (tags.isNotEmpty) {
      getTagsChilds();

      return Row(
        children: tagChilds,
      );
    } else {
      return const SizedBox();
    }
  }
}
