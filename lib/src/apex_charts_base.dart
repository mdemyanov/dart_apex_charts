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

  /// The render() method is responsible for drawing the chart on the page.
  ///
  /// It is the primary method which has to be called after configuring the
  /// options.
  Future<JsObject> render() async => _callMethod('render');

  ///Allows you to update the series array overriding the existing one.
  ///
  ///If you want to append dataset to existing series, use the appendData()
  ///method
  JsObject updateSeries(
          [List<Map> newSeries = const [], bool animate = true]) =>
      _callMethod('updateSeries', [JsObject.jsify(newSeries), animate]);
  ///Allows you to append new data to the series array.
  ///
  ///If you have existing multiple series, provide the new array in the same
  ///indexed manner.
  JsObject appendData(List<Map> newSeries) =>
      _callMethod('appendData', [JsObject.jsify(newSeries)]);
  ///Allows you to update the configuration object by passing the options as
  ///first parameter.
  ///
  ///The new config object is merged with the existing config object preserving
  ///the existing configuration.
  JsObject updateOptions(Map newOptions, [bool animate = true]) =>
      _callMethod('updateOptions', [JsObject.jsify(newOptions), animate]);
  ///The addText() method can be used to draw text after chart is rendered.
  ///
  ///The position of the text is controlled by x and y parameters. You can also
  ///provide the styling of the text as well change background color of the rect
  /// around text.
  JsObject addText(Map options) =>
      _callMethod('addText', [JsObject.jsify(options)]);
  ///The addXaxisAnnotation() method can be used to draw annotations after chart is rendered.
  JsObject addXaxisAnnotation(Map options) =>
      _callMethod('addXaxisAnnotation', [JsObject.jsify(options)]);
  ///The addYaxisAnnotation() method can be used to draw annotations after chart is rendered.
  JsObject addYaxisAnnotation(Map options) =>
      _callMethod('addYaxisAnnotation', [JsObject.jsify(options)]);
  ///The addPointAnnotation() method can be used to draw annotations after chart is rendered.
  JsObject addPointAnnotation(Map options) =>
      _callMethod('addPointAnnotation', [JsObject.jsify(options)]);
}
