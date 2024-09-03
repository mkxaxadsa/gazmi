import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/filter_bloc.dart';

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        List<BarChartGroupData> barCharts = [];
        if (state is FilterDataState) {
          barCharts = _buildBarGroups(state.data, weekday: state.weekday);
        }
        return BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            // maxY: 10,
            barGroups: barCharts,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget:
                      barCharts.length == 4 ? _bottomTitlesWeek : _bottomTitles,
                  reservedSize: 24,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                // tooltipBgColor: Colors.transparent,
                tooltipPadding: EdgeInsets.zero,
                tooltipMargin: 8,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    rod.toY.round().toString(),
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<List<double>> bars,
      {int? weekday}) {
    return bars
        .map(
          (e) => _makeGroupData(weekday ?? bars.indexOf(e), e[0], e[1]),
        )
        .toList();
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Color(0xFF60D394),
          width: 10,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.white,
          width: 10,
        ),
      ],
    );
  }

  Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Mon', style: style);
        break;
      case 1:
        text = Text('Tue', style: style);
        break;
      case 2:
        text = Text('Wed', style: style);
        break;
      case 3:
        text = Text('Thr', style: style);
        break;
      case 4:
        text = Text('Fri', style: style);
        break;
      case 5:
        text = Text('Sat', style: style);
        break;
      case 6:
        text = Text('Sun', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }

  Widget _bottomTitlesWeek(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('W 1', style: style);
        break;
      case 1:
        text = Text('W 2', style: style);
        break;
      case 2:
        text = Text('W 3', style: style);
        break;
      case 3:
        text = Text('W 4', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: text,
    );
  }
}
