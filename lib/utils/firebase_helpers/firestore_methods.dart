import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:picipo/models/transaction_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List tranHistoryList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("transaction");

  Future getTransactionHistory() async {
    try {
      // to get data from all documents sequentially
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          tranHistoryList.add(result.data());
        }
      });

      return tranHistoryList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  // upload transaction History
  Future<String> uploadtransactionHistory({
    required String? userAddress,
    required String? destAddress,
    required String? trxHash,
    required String? amount,
  }) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postId = const Uuid().v1(); // creates unique id based on time
      TransactionModel post = TransactionModel(
        id: postId,
        dateTime: DateTime.now(),
        userAddress: userAddress,
        destAddress: destAddress,
        trxHash: trxHash,
        amount: amount,
      );

      _firestore
          .collection('transaction')
          .add(post.toJson())
          .then((value) => debugPrint('transaction history added'))
          .catchError((error) =>
              debugPrint('Failed to add transaction history $error'));
      res = "success";
    } catch (err) {
      res = err.toString();
      print('error: $err');
    }
    return res;
  }
}
