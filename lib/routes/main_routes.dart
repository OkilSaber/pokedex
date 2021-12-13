import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_list/bloc.dart';
import 'package:pokedex/bloc/search/bloc.dart';
import 'package:pokedex/ui/screens/pokemon_list.dart';

List<CupertinoTabView> pages = [
  CupertinoTabView(
    builder: (context) {
      return CupertinoPageScaffold(
        child: BlocProvider(
          create: (_) => PokemonListBloc(),
          child: const PokemonListScreen(),
        ),
      );
    },
  ),
  CupertinoTabView(
    builder: (context) {
      return CupertinoPageScaffold(
        child: BlocProvider(
          create: (_) => SearchBloc(),
          child: const Text("tekt"),
        ),
      );
    },
  ),
];

List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.ant_fill),
    label: 'Pokemon List',
  ),
  const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.search),
    label: 'Search',
  ),
];

class MainRoutes extends StatefulWidget {
  const MainRoutes({Key? key}) : super(key: key);

  @override
  HomeMainRouteState createState() => HomeMainRouteState();
}

class HomeMainRouteState extends State<MainRoutes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
      ),
      tabBuilder: (context, index) {
        return pages[index];
      },
    );
  }
}
