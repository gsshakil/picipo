import 'package:flutter/material.dart';
import 'package:picipo/views/dashboard/node_card.dart';

class BanlaceStatsRow extends StatelessWidget {
  const BanlaceStatsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Expanded(
                child: NodeCard(
                  title: 'Company X\nEmployee Funds',
                  balance: '1000.00',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Expanded(
                child: NodeCard(
                  title: 'Withdrawable',
                  balance: '0.00',
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Expanded(
                child: NodeCard(
                  title: 'Total ROI\n(Estimated)',
                  balance: '1360.00',
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
