import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/ethers.dart';
import 'package:flutter_web3/flutter_web3.dart' as web3;

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 4;

  String currentAddress = '';

  int currentChain = -1;

  bool get isEnabled => web3.ethereum != null;

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  Future<void> connect() async {
    if (isEnabled) {
      final accs = await web3.ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await web3.ethereum!.getChainId();
      log('CURRENTCHAIN: $currentChain ');

      notifyListeners();
    }
  }

  Future<dynamic> getBalance() async {
    // final web3provider = Web3Provider(web3.ethereum!);
    // var block = await web3.ethereum!.getAccounts();
    // var balance = await provider!.getBalance(currentAddress);
    // log('WEB3: balance $balance ');
    // log('WEB3: bloc $block');
    // Send 1000000000 wei to `0xcorge`
    final tx = await web3.provider!.getSigner().sendTransaction(
          TransactionRequest(
            to: '0xcorge',
            value: BigInt.from(1000000000),
          ),
        );

    tx.hash; // 0xplugh

    final receipt = await tx.wait();

    log('WEB3: ${receipt is TransactionReceipt}');
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    notifyListeners();
  }

  init() {
    if (isEnabled) {
      web3.ethereum!.onAccountsChanged((accounts) {
        clear();
      });
      web3.ethereum!.onChainChanged((accounts) {
        clear();
      });
    }
  }
}
