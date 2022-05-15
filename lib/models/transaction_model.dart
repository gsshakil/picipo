import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String? id;
  final DateTime? dateTime;
  final String? userAddress;
  final String? destAddress;
  final String? trxHash;
  final String? amount;

  const TransactionModel({
    required this.id,
    required this.dateTime,
    required this.userAddress,
    required this.destAddress,
    required this.trxHash,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        id,
        dateTime,
        userAddress,
        destAddress,
        trxHash,
        amount
      ];

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        dateTime: json["dateTime"],
        userAddress: json["userAddress"],
        destAddress: json["destAddress"],
        trxHash: json["trxHash"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateTime": dateTime,
        "userAddress": userAddress,
        "destAddress": destAddress,
        "trxHash": trxHash,
        "amount": amount,
      };
}
