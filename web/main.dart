import 'dart:html';
import 'package:pwa/client.dart' as pwa;

void main() {
  if (window.location.hostname != 'localhost') {
    new pwa.Client();
  }

  NumberInputElement rngAlcohol = document.getElementById('alcohol');
  NumberInputElement rngGasoline = document.getElementById('gasoline');

  rngAlcohol.onKeyUp.listen(currencyMask);
  rngGasoline.onKeyUp.listen(currencyMask);

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

void currencyMask(KeyboardEvent e) {
    String input = (e.target as NumberInputElement).value;
    NumberInputElement txtInput = (e.target as NumberInputElement);
    if (![8,48,49,50,51,52,53,54,55,56,57,58].contains(e.keyCode)) {
      txtInput.value = txtInput.value.substring(0, txtInput.value.length-1);
      return;
    }
    
    if (e.keyCode == KeyCode.BACKSPACE) {
      input = txtInput.value;
    }

    input = (input != null || input != '') ? input : 0;
    if(input.length >= 3 && double.parse(input.replaceAll(',', '.')) < 1) {
      input = input.substring(2);
    }

    if (input == '0' || input.length == 0) {
      txtInput.value = '0.00';
      return;
    }
    if(input.length == 1) {
      txtInput.value = '0.0${input}';
    } else if(input.length == 2) {
      txtInput.value = '0.${input}';
    } else {
      List<String> formattedValue = input.replaceAll('.', '').split('');
      formattedValue.insert(formattedValue.length-2, '.');
      double finalValue = double.parse(formattedValue.join(''));
      txtInput.value = finalValue.toString();
    }
  }
