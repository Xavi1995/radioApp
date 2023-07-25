
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, required this.child, this.leading, this.appBar});

  final Widget child;

  final Widget? leading;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
