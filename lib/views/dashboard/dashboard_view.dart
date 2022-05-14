import 'package:flutter/material.dart';
import 'package:picipo/views/dashboard/balance_stats_row.dart';
import 'package:picipo/views/dashboard/deposit_withdrawal_box.dart';
import 'package:picipo/views/dashboard/last_quarter_bar_chart.dart';
import 'package:picipo/views/dashboard/weekly_estimation_section.dart';
import 'package:picipo/views/dashboard/weekly_estmimation_header.dart';
import 'package:picipo/views/dashboard/weekly_profit_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BanlaceStatsRow(),
        const SizedBox(height: 10),
        const WeeklyEstimationSection(),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            LastQuarterBarChart(),
            DepositWithdrawelBox(),
          ],
        ),
      ],
    );
  }
}
