import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'nav_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Siga Mobile'),
          backgroundColor: Color.fromARGB(255, 25, 28, 228),
        ),
        drawer: NavigationDrawer(),
        body: Center(child: MyHomePage(title: 'Flutter Demo Home Page')),
      );
}

//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       body: Center(
//         child: Text('Hola mundo'),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
      title: ChartTitle(text: 'Reporte de ventas '),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        RadialBarSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            maximumValue: 40000)
      ],
    )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Julio', 1600),
      GDPData('Agosto', 2490),
      GDPData('Septiembre', 2900),
      GDPData('Octubre', 23050),
      GDPData('Noviembre', 24880),
      GDPData('Diciembre', 0),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
