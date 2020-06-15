import 'package:flutter_test/flutter_test.dart';
import 'package:number_to_text/number_to_text.dart';

void main() {
  
  test('Test the method if it Converts to DUZENTOS', (){
    expect(NumberToText().convert(value: 200), 'DUZENTOS');


  });

    test('Test the method if it Converts to UM MILHÃO', (){
    expect(NumberToText().convert(value: 1000000), 'UM MILHÃO');


  });

    test('Test the method if it Converts to UM MILHÃO E VINTE E CINCO CENTAVOS', (){
    expect(NumberToText().convert(value: 1000000.25), 'UM MILHÃO E VINTE E CINCO CENTAVOS');


  });

    test('Test the method if it Converts to VINTE E CINCO CENTAVOS', (){
    expect(NumberToText().convert(value:.25), 'VINTE E CINCO CENTAVOS');


  });

     test('Test the method if it Converts to VINTE E CINCO', (){
    expect(NumberToText().convert(value:25), 'VINTE E CINCO');


  });

  

  

}
