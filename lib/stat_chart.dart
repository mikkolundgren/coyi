import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WHStatsChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  const WHStatsChart(this.seriesList, {this.animate});

  factory WHStatsChart.withSampleDate() {
    return new WHStatsChart(_createSampleData(), animate: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: Center(
        child: new charts.PieChart(
          seriesList,
          animate: animate,
          defaultRenderer: new charts.ArcRendererConfig(
            arcRatio: 0.5,
            arcRendererDecorators: [new charts.ArcLabelDecorator()],
          ),
        ),
      ),
    );
  }

  static List<charts.Series<Stat, dynamic>> _createSampleData() {
    final data = [new Stat("W", 2), new Stat("D", 1), new Stat("L", 1)];
    return [
      new charts.Series<Stat, dynamic>(
        id: 'Stats',
        domainFn: (Stat stats, _) => stats.type,
        measureFn: (Stat stats, _) => stats.total,
        data: data,
        labelAccessorFn: (Stat row, _) => '${row.type} : ${row.total}',
      )
    ];
  }
}

class Stat {
  final String type;
  final int total;

  Stat(this.type, this.total);
}
