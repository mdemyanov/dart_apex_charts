import 'package:dart_apex_charts/dart_apex_charts.dart';

void main() {
  Map<String, dynamic> options = <String, dynamic>{
    'chart': {
      'height': 380,
      'type': 'bar',
    },
    'plotOptions': {
      'bar': {
        'horizontal': true,
      }
    },
    'dataLabels': {'enabled': false},
    'series': [
      {
        'data': [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
      }
    ],
    'xaxis': {
      'categories': [
        'South Korea',
        'Canada',
        'United Kingdom',
        'Netherlands',
        'Italy',
        'France',
        'Japan',
        'United States',
        'China',
        'Germany'
      ],
    },
    'yaxis': <String, dynamic>{},
    'tooltip': <String, dynamic>{}
  };
  ApexCharts chart = ApexCharts('#chart', options);
  chart.render();
}
