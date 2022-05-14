import 'package:flutter/material.dart';
import 'package:picipo/providers/metamask_provider.dart';
import 'package:picipo/routing/route_names.dart';
import 'package:picipo/routing/router.dart';
import 'package:picipo/services/locator.dart';
import 'package:picipo/services/navigation_services.dart';
import 'package:picipo/widgets/navigation_bar/navigation_bar.dart';
import 'package:picipo/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/centered_view/centered_view.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..init(),
        builder: (context, snapshot) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) => Scaffold(
              drawer:
                  sizingInformation.deviceScreenType == DeviceScreenType.mobile
                      ? NavigationDrawer()
                      : null,
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 211, 161, 159),
                        Color.fromARGB(255, 156, 142, 192),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: CenteredView(
                  child: Column(
                    children: <Widget>[
                      const NavigationBarMain(),
                      Expanded(
                        child: Navigator(
                          key: locator<NavigationService>().navigatorKey,
                          onGenerateRoute: generateRoute,
                          initialRoute: HomeRoute,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
