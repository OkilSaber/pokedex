import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NavigationRouteInterface {
//   final Icon icon;
//   final String label;
//   final Widget widget;
//   const NavigationRouteInterface(this.icon, this.label, this.widget);
// }

List<CupertinoTabView> navigationRoutes = [
  CupertinoTabView(builder: (context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Products List"),
      ),
    );
  }),
  CupertinoTabView(builder: (context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Search"),
      ),
    );
  }),
  CupertinoTabView(builder: (context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text("Shopping Cart"),
      ),
    );
  })
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return navigationRoutes[index];
      },
    );
  }
}
