import 'package:flutter/material.dart';
import 'package:picipo/providers/home_provider.dart';
import 'package:picipo/views/home/stake_deposit_form.dart';
import 'package:provider/provider.dart';

class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: const StakeDepositForm(),
    );
  }
}
