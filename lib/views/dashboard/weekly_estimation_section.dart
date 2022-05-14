import 'package:flutter/material.dart';
import 'package:picipo/views/dashboard/weekly_estmimation_header.dart';
import 'package:picipo/views/dashboard/weekly_profit_card.dart';

class WeeklyEstimationSection extends StatelessWidget {
  const WeeklyEstimationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const WeeklyEstimateHeader(),
          const Divider(),
          Row(
            children: const [
              Expanded(
                child: WeeklyProfitCard(
                  title: 'Week 1 Profit',
                  subTitle: 'May 1 - May 7',
                  balance: '1.3%',
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: WeeklyProfitCard(
                  title: 'Week 2 Profit',
                  subTitle: 'May 8 - May 14',
                  balance: 'unknown',
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: WeeklyProfitCard(
                  title: 'Week 3 Profit',
                  subTitle: 'May 15 - May 21',
                  balance: 'unknown',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
