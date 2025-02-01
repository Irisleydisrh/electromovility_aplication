import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart' show NumberFormat;

class ChartsSubpage extends StatefulWidget {
  const ChartsSubpage({super.key});

  @override
  State<ChartsSubpage> createState() => _ChartsSubpageState();
}

class _ChartsSubpageState extends State<ChartsSubpage> {
  final List<ChartData> chartData = [
    ChartData("08 \n may", 10),
    ChartData("09 \n may", 23),
    ChartData("10 \n may", 34),
    ChartData("11 \n may", 25),
    ChartData("12 \n may", 40),
    ChartData("13 \n may", 60),
    ChartData("14 \n may", 50),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(const Color.fromRGBO(53, 184, 134, 0.2));
    color.add(const Color.fromRGBO(53, 184, 134, 0.7));
    color.add(const Color.fromRGBO(53, 184, 134, 1));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color,
        stops: stops,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.43,
        child: SfCartesianChart(
          tooltipBehavior: TooltipBehavior(
            enable: true,
            opacity: 0.75,
            color: Colors.green.withOpacity(0.5),
          ),
          primaryYAxis: NumericAxis(
            decimalPlaces: 2,
            numberFormat: NumberFormat("###########.## kW"),
            labelStyle: const TextStyle(
              color: Color.fromRGBO(53, 184, 134, 1),
              fontSize: 10,
            ),
          ),
          primaryXAxis: const CategoryAxis(
            labelStyle: TextStyle(
              color: Color.fromRGBO(53, 184, 134, 1),
            ),
          ),
          margin: const EdgeInsets.all(10),
          palette: const [
            Color.fromRGBO(53, 184, 134, 1),
          ],
          series: <CartesianSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              gradient: gradientColors,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.day,
              yValueMapper: (ChartData data, _) => data.value,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.day, this.value);

  final String day;
  final double value;
}
