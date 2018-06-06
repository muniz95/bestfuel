import 'dart:html';
import 'package:pwa/client.dart' as pwa;

void main() {
  if (window.location.hostname == 'localhost') {
    new pwa.Client();
  } else {
    new pwa.Client(scriptUrl: '/bestfuel/pwa.dart.js');
  }

  HtmlElement btnCalculate = document.getElementById('calculate');
  btnCalculate.onClick.listen((Event e) {
    InputElement txtAlcohol = document.getElementById('alcohol');
    InputElement txtGasoline = document.getElementById('gasoline');

    double alcohol;
    if (txtAlcohol.value.contains(',')){
      alcohol = double.parse(txtAlcohol.value.split(',').join('.'));
    } else {
      alcohol = double.parse(txtAlcohol.value);
    }
    
    double gasoline;
    if (txtGasoline.value.contains(',')){
      gasoline = double.parse(txtGasoline.value.split(',').join('.'));
    } else {
      gasoline = double.parse(txtGasoline.value);
    }

    calculate(alcohol, gasoline);
  });
}

void calculate(double alcohol, double gasoline) {
  double result = alcohol / gasoline;
  if (result >= 0.6) {
    document.getElementById('result-gasoline').style.backgroundColor = 'red';
    document.getElementById('result-alcohol').style.backgroundColor = 'black';
  } else {
    document.getElementById('result-alcohol').style.backgroundColor = 'green';
    document.getElementById('result-gasoline').style.backgroundColor = 'black';
  }
}
