import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/ethers.dart';
import 'package:flutter_web3/flutter_web3.dart' as web3;
import 'package:picipo/utils/constanst.dart';

class MetaMaskProvider extends ChangeNotifier {
  static const operatingChain = 4;
  static const chainName =
      operatingChain == 4 ? 'Rinkeby Test Network' : 'other';

  String currentAddress = '';

  int currentChain = -1;

  bool get isEnabled => web3.ethereum != null;

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  var _balance;
  get balacne => _balance;

  setBalance(balance) {
    _balance = balance;
    notifyListeners();
  }

  Future<void> connect() async {
    if (isEnabled) {
      final accs = await web3.ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await web3.ethereum!.getChainId();
      log('CURRENTCHAIN: $currentChain ');

      var bal = await web3.provider!.getBalance(currentAddress);
      setBalance(bal);

      notifyListeners();
    }
  }

  Future<dynamic> makeTransfer(amount) async {
    final tx = await web3.provider!.getSigner().sendTransaction(
          TransactionRequest(
            to: DEFAULT_ADDRESS,
            value: BigInt.from(amount),
          ),
        );
    if (tx.hash != null) {
      tx.hash; // 0xplugh

      final receipt = await tx.wait();
      return receipt;
    } else {
      return false;
    }
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
