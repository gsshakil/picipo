import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LastQuarterBarChart extends StatefulWidget {
  const LastQuarterBarChart({Key? key}) : super(key: key);

  @override
  State<LastQuarterBarChart> createState() => _LastQuarterBarChartState();
}

class _LastQuarterBarChartState extends State<LastQuarterBarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Feb 2022', 5),
      _ChartData('March 2022', 45),
      _ChartData('April 2022', 75),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Gold',
                  color: Color.fromARGB(255, 10, 161, 104))
            ]),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
