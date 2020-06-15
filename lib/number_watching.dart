import 'package:intl/intl.dart';
import 'package:number_to_text/number_conversion.dart';
import 'package:number_to_text/numbers.dart';

String numberWatching(double value) {
  if (value <= 0 || value >= 1000000000000000) {
    return 'Not supported number';
  }

  ///[LET'S CREATE A TEMPLATE FOR THE NUMBER PLACES TO KNOW ITS LENGTH]
  String _TEMPLATE = '';

  ///[ADD 2 DECIMAL PLACES]
  String _FORMATTED_VALUE =
      NumberFormat.currency(locale: 'en_us', decimalDigits: 2, name: '')
          .format(value)
          .replaceAll(',', '')
          .trim(); 


  for (int k = 0; k < 18 - _FORMATTED_VALUE.length; k++) {
    _TEMPLATE += '0';
  }
  _TEMPLATE += _FORMATTED_VALUE;
  String _CONVERTED_NUMBER = '';

  for (int k = 0; k <= 15; k += 3) {
    double currentValue = k == 0
        ? 0
        : double.parse((_TEMPLATE[k] + _TEMPLATE[k + 1] + _TEMPLATE[k + 2]));

    _CONVERTED_NUMBER += numberConversion(value: currentValue);
    if (k == 0 && _CONVERTED_NUMBER != '') {
      int _val = int.parse((_TEMPLATE[0] + _TEMPLATE[1] + _TEMPLATE[2]));
      if (_val == 1) {
         _CONVERTED_NUMBER += ' TRILHÃO' +
            (PositionNumber().getTrillion(template: _TEMPLATE) > 0 ? ' E' : '');
      }
       _CONVERTED_NUMBER += ' TRILHÕES' +
          (PositionNumber().getTrillion(template: _TEMPLATE) > 0 ? ' E' : '');
    } else if (k == 3 && _CONVERTED_NUMBER != '') {
      int _val = int.parse((_TEMPLATE[3] + _TEMPLATE[4] + _TEMPLATE[5]));
      if (_val == 1) {
         _CONVERTED_NUMBER += ' BILHÃO' +
            (PositionNumber().getBillion(template: _TEMPLATE) > 0 ? ' E' : '');
      }

       _CONVERTED_NUMBER += ' BILHÕES' +
          (PositionNumber().getBillion(template: _TEMPLATE) > 0 ? ' E' : '');
    } else if (k == 6 && _CONVERTED_NUMBER != '') {
      int _val = int.parse((_TEMPLATE[6] + _TEMPLATE[7] + _TEMPLATE[8]));
      if (_val == 1) {
       
         _CONVERTED_NUMBER += ' MILHÃO' +
            (PositionNumber().getMillion(template: _TEMPLATE) > 0 ? ' E' : '');
      }
       else if(_val>1){
         _CONVERTED_NUMBER += ' MILHÕES' +
          (PositionNumber().getMillion(template: _TEMPLATE) > 0 ? ' E' : '');
       }
    } else if (k == 9 && _CONVERTED_NUMBER != '') {
      int _val = int.parse((_TEMPLATE[9] + _TEMPLATE[10] + _TEMPLATE[11]));
      if (_val > 0) {
        if (_CONVERTED_NUMBER.toUpperCase().contains('UM')) {
           _CONVERTED_NUMBER = ' MIL' +
              (PositionNumber().getThousand(template: _TEMPLATE) > 0 ? ' E' : '');
        }
        else{ _CONVERTED_NUMBER += ' MIL' +
            (PositionNumber().getThousand(template: _TEMPLATE) > 0 ? ' E' : '');}
      }
    } else if (k == 12) {
     
      int _cents = int.parse((_TEMPLATE[16] + _TEMPLATE[17])); //CENTS

      if (_cents > 0 && _CONVERTED_NUMBER != '') {
        _CONVERTED_NUMBER += ' E ';
      }
    } else if (k == 15) {
      int _val = int.parse((_TEMPLATE[16] + _TEMPLATE[17]));
      if (_val == 1) {
         _CONVERTED_NUMBER += ' CENTAVO';
      }
       else if(_val>1){_CONVERTED_NUMBER += ' CENTAVOS';}
    }
  }

  return _CONVERTED_NUMBER;
}
