import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:picipo/providers/metamask_provider.dart';
import 'package:provider/provider.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MetaMaskProvider>(
      builder: (context, provider, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction History',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('transaction')
                        .where("userAddress",
                            isEqualTo: provider.currentAddress)
                        .snapshots(),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot,
                    ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return snapshot.data!.docs.isEmpty
                            ? const Center(
                                child: Text('Nothing Found'),
                              )
                            : DataTable(
                                columns: const [
                                  DataColumn(label: Text('Date')),
                                  DataColumn(label: Text('Profit (%)')),
                                  DataColumn(label: Text('Profit (EUR)')),
                                  DataColumn(
                                      label: Text('Employee Fund(Token)')),
                                ],
                                rows: snapshot.data!.docs.map((e) {
                                  var doc = e.data();
                                  var dataNasc =
                                      DateTime.fromMicrosecondsSinceEpoch(
                                          doc['dateTime']
                                              .microsecondsSinceEpoch);
                                  var format = DateFormat('dd-MM-yyyy hh:mm aa');
                                  var formatedDate = format.format(dataNasc);
                                  return DataRow(cells: [
                                    DataCell(
                                      Text(formatedDate.toString()),
                                    ),
                                    const DataCell(
                                      Text('0%'),
                                    ),
                                    const DataCell(
                                      Text('0'),
                                    ),
                                    DataCell(
                                      Text(doc['amount']),
                                    ),
                                  ]);
                                }).toList(),
                              );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
