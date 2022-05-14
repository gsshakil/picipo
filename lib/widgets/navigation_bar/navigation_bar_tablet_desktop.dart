import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:picipo/providers/metamask_provider.dart';
import 'package:picipo/routing/route_names.dart';
import 'package:picipo/widgets/navigation_bar/navbar_item.dart';
import 'package:picipo/widgets/navigation_bar/navbar_logo.dart';
import 'package:provider/provider.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              const SizedBox(width: 30),
              Consumer<MetaMaskProvider>(builder: (context, provider, child) {
                if (provider.isConnected) {
                  return NavBarItem(
                      title: 'Dashboard', navigationPath: DashboardRoute);
                } else {
                  return Container();
                }
              }),
            ],
          ),
          Consumer<MetaMaskProvider>(builder: (context, provider, child) {
            String text = '';

            if (provider.isConnected && provider.isInOperatingChain) {
              text = provider.currentAddress;
              // return Row(
              //   children: [
              //     ShaderText(text: text),
              //     const SizedBox(width: 10),
              //     ConnectButton(
              //       title: 'DISCONNECT',
              //       onPressed: () {
              //         context.read<MetaMaskProvider>().clear();
              //       },
              //     ),
              //   ],
              // );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShaderText(text: text),
                  const SizedBox(height: 5),
                  ShaderText(text: 'Balance: ${provider.balacne}'),

                  // provider.isLoading
                  //     ? const SizedBox(
                  //         width: 25,
                  //         height: 25,
                  //         child: CircularProgressIndicator(),
                  //       )
                  //     : ConnectButton(
                  //         title: 'Check Balance',
                  //         onPressed: () {
                  //           print('object');
                  //           provider.getBalance();
                  //         }),
                ],
              );
            } else if (provider.isConnected && !provider.isInOperatingChain) {
              text =
                  'Wrong chain. Please connect to ${MetaMaskProvider.chainName}';
            } else if (provider.isEnabled && !provider.isConnected) {
              return ConnectButton(
                title: 'CONNECT WALLET',
                onPressed: () {
                  context.read<MetaMaskProvider>().connect();
                },
              );
            } else {
              text = 'Please use a Web3 supported browser.';
            }
            return ShaderText(text: text);
          }),
        ],
      ),
    );
  }
}

class ShaderText extends StatelessWidget {
  const ShaderText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.purple, Colors.blue, Colors.red],
      ).createShader(bounds),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 142, 51, 146)),
        onPressed: () async {
          onPressed();
        },
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
