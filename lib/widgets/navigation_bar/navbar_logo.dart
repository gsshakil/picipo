import 'package:flutter/material.dart';
import 'package:picipo/routing/route_names.dart';
import 'package:picipo/services/locator.dart';
import 'package:picipo/services/navigation_services.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(HomeRoute);
      },
      child: SizedBox(
        height: 80,
        width: 150,
        child: Image.asset('assets/ufarm-logo.png'),
      ),
    );
  }
}
