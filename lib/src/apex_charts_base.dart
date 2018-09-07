import 'dart:js';
import 'dart:html';
import 'dart:async';

class ApexCharts {
  final String _nameContext = 'ApexCharts';
  JsObject _jsOptions;
  JsObject _chart;

  ApexCharts(String selector, Map options) {
    this._jsOptions = JsObject.jsify(options);
    this._chart =
        JsObject(context[_nameContext], [querySelector(selector), _jsOptions]);
  }

  JsObject _callMethod(String methodName, [List options = const []]) =>
      JsObject(_chart.callMethod(methodName, options));

  /// The render() method is responsible for drawing the chart on the page. It is the primary method which has to be called after configuring the options.
  ///
  ///
  Future<JsObject> render() async => _callMethod('render');

  JsObject updateSeries(
          [List<Map> newSeries = const [], bool animate = true]) =>
      _callMethod('updateSeries', [JsObject.jsify(newSeries), animate]);

  JsObject appendData(List<Map> newSeries) =>
      _callMethod('appendData', [JsObject.jsify(newSeries)]);

  JsObject updateOptions(Map newOptions, [bool animate = true]) =>
      _callMethod('updateOptions', [JsObject.jsify(newOptions), animate]);

  JsObject addText(Map options) =>
      _callMethod('addText', [JsObject.jsify(options)]);

  JsObject addXaxisAnnotation(Map options) =>
      _callMethod('addXaxisAnnotation', [JsObject.jsify(options)]);

  JsObject addYaxisAnnotation(Map options) =>
      _callMethod('addYaxisAnnotation', [JsObject.jsify(options)]);

  JsObject addPointAnnotation(Map options) =>
      _callMethod('addPointAnnotation', [JsObject.jsify(options)]);

  JsObject paper() => _callMethod('paper', []);
}
