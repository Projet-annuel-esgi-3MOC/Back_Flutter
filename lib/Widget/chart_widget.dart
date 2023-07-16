import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:back_web_pa_flutter/WebServices/data_service.dart';

class ChartWidget extends StatelessWidget {
  final List<SalesData> chartData;
  final bool animate;

  const ChartWidget({
    required this.chartData,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    // Créer une série à partir des données //
    final series = [
      charts.Series(
        id: 'Sales',
        data: chartData,
        domainFn: (SalesData sales, _) => sales.year,
        measureFn: (SalesData sales, _) => sales.sales,
      ),
    ];

    return charts.BarChart(
      series,
      animate: animate,
    );
  }
}
