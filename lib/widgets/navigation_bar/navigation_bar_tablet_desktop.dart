import 'package:flutter/material.dart';
import 'package:picipo/routing/route_names.dart';
import 'package:picipo/widgets/navigation_bar/navbar_item.dart';
import 'package:picipo/widgets/navigation_bar/navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              const NavBarLogo(),
              const SizedBox(width: 60),
              NavBarItem(title: 'Home', navigationPath: HomeRoute),
              const SizedBox(width: 30),
              NavBarItem(title: 'About', navigationPath: AboutRoute),
            ],
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 142, 51, 146)),
              onPressed: () {},
              child: const Center(
                child: Text('CONNECT WALLET'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
