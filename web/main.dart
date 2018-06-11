import 'dart:html';
import 'package:pwa/client.dart' as pwa;

void main() {
  if (window.location.hostname != 'localhost') {
    new pwa.Client();
  }

  RangeInputElement rngAlcohol = document.getElementById('alcohol');
  RangeInputElement rngGasoline = document.getElementById('gasoline');

  rngAlcohol.onInput.listen((Event e) {
    String price = 'R\$ ${(e.target as RangeInputElement).valueAsNumber.toStringAsFixed(2)}';
    document.getElementById('alcoholPrice').text = price;
    rngAlcohol.attributes['tooltip'] = price;
  });
  rngGasoline.onInput.listen((Event e) {
    String price = 'R\$ ${(e.target as RangeInputElement).valueAsNumber.toStringAsFixed(2)}';
    document.getElementById('gasolinePrice').text = price;
    rngGasoline.attributes['tooltip'] = price;
  });

  HtmlElement btnCalculate = document.getElementById('calculate');
  btnCalculate.onClick.listen((Event e) {

    double alcohol;
    if (rngAlcohol.value.contains(',')){
      alcohol = double.parse(rngAlcohol.value.split(',').join('.'));
    } else {
      alcohol = double.parse(rngAlcohol.value);
    }
    
    double gasoline;
    if (rngGasoline.value.contains(',')){
      gasoline = double.parse(rngGasoline.value.split(',').join('.'));
    } else {
      gasoline = double.parse(rngGasoline.value);
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
