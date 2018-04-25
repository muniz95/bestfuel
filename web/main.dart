import 'dart:html';

void main() {
  HtmlElement btnCalculate = document.getElementById('calculate');
  btnCalculate.onClick.listen((e) {
    Element txtAlcohol = document.getElementById('alcohol');
    Element txtGasoline = document.getElementById('gasoline');

    print(txtAlcohol.text);
    print(txtGasoline.text);
  });
}
