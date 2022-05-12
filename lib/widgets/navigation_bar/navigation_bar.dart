import 'package:flutter/material.dart';
import 'package:picipo/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:picipo/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarMain extends StatelessWidget {
  const NavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const NavigationBarMobile(),
      tablet: const NavigationBarTabletDesktop(),
    );
  }
}
