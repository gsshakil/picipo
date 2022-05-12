import 'package:flutter/material.dart';
import 'package:picipo/services/locator.dart';
import 'package:picipo/services/navigation_services.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  NavBarItem({Key? key, required this.title, required this.navigationPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
