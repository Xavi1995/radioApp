import 'package:flutter/material.dart';
import 'package:radio_app/ui/features/landing/widgets/landing_loader.dart';
import 'package:radio_app/ui/styles/custom_colors.dart';
import 'package:radio_app/ui/styles/custom_text_styles.dart';

class LandingLayout extends StatelessWidget {
  const LandingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomLoaderMusic(color: CustomColors.primaryColor),
          Text(
            'Radio Music app',
            style: CustomStyles.landingHeader,
          ),
        ],
      ),
    );
  }
}
