import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/core/routing/router.dart' as router;
import 'package:radio_app/di/app_di.dart' as app_di;
import 'package:radio_app/ui/bloc_providers_store.dart';
import 'package:radio_app/ui/styles/themes.dart';

import 'core/utils/system_overlay.dart';

void main() async {
  app_di.init();

  WidgetsFlutterBinding.ensureInitialized();

  setSystemOverlay();
  setPreferredOrientations();

  run();
}

void run() {
  runApp(BlocProviderStore.init(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return const RadioStationApp();
          },
        ),
      ),
    ),
  ));
}

class RadioStationApp extends StatelessWidget {
  const RadioStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProviderStore.init(
        child: FutureBuilder(
          future: GetIt.I.allReady(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: RouteConstants.landing,
                onGenerateRoute: router.generateRoute,
                theme: appThemesData[AppTheme.light],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
