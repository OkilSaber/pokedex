import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/routes/main_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
      title: 'Pokedex',
      home: Builder(
        builder: (BuildContext context) {
          return DefaultTextStyle(
            style: CupertinoTheme.of(context).textTheme.textStyle,
            child: const AppStructure(),
          );
        },
      ),
    );
  }
}

class AppStructure extends StatelessWidget {
  const AppStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Pokedex'),
      ),
      child: MainRoutes(),
    );
  }
}
