import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      required this.child,
      required this.appBarTitle,
      this.leading});

  final Widget child;
  final String appBarTitle;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: AppBar(
        leading: leading ?? const SizedBox(),
        title: Text(appBarTitle),
      ),
    );
  }
}
