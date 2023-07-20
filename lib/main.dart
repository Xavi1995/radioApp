import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/core/constants/routing_constants.dart';
import 'package:radio_app/core/routing/router.dart' as router;
import 'package:radio_app/di/app_di.dart' as app_di;
import 'package:radio_app/ui/bloc_providers_store.dart';
import 'package:radio_app/ui/widgets/loader.dart';

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
    child: const Material(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: RadioStationApp(),
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
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: RouteConstants.landing,
                onGenerateRoute: router.generateRoute,
              );
            } else {
              return const CustomLoader();
            }
          },
        ),
      ),
    );
  }
}
