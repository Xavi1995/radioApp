import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';

class HeaderDescription extends StatelessWidget {
  const HeaderDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose between 100 radios. Tap one of them and start listening.',
          style: CustomStyles.smallBody.copyWith(color: CustomColors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Icon(
              Icons.music_note_rounded,
              color: CustomColors.grey,
            ),
            const SizedBox(width: 6),
            Text(
              'List of radio stations',
              style: CustomStyles.smallBody.copyWith(
                color: CustomColors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }
}
