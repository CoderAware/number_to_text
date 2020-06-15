import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String numberConversion({@required double value}) {
  if (value <= 0) {
    return '';
  }

  String _AGGREGATER = '';
  if (value > 0 && value < 1) {
    value *= 100;
  }

  ///[OUR TEMPLATE]
  String _TEMPLATE = '';
  

  ///[ADD 2 DECIMAL PLACES]
  String _FORMATTED_VALUE =
      NumberFormat.currency(locale: 'en_us', decimalDigits: 0, name: '')
          .format(value)
          .replaceFirst(',', '')
          .replaceFirst('.', '')
          .trim();

  int leng = ('000'.length - _FORMATTED_VALUE.length);
  if (leng < 0 || leng == 0) {
    _TEMPLATE = _FORMATTED_VALUE;
  } else {
    for (int k = 0; k <= leng - 1; k++) {
      _TEMPLATE += '0';
    }
    _TEMPLATE += _FORMATTED_VALUE;
  }
 

    /*  -
       '_'

    
    */

  int a = int.parse(_TEMPLATE[0]);
  int b = int.parse(_TEMPLATE[1]);
  int c = int.parse(_TEMPLATE[2]);

  if (a == 1) {
    _AGGREGATER += (b + c == 0) ? 'CEM' : 'CENTO';
  } else if (a == 2) {
    _AGGREGATER += 'DUZENTOS';
  } else if (a == 3) {
    _AGGREGATER += 'TREZENTOS';
  } else if (a == 4) {
    _AGGREGATER += 'QUATROCENTOS';
  } else if (a == 5) {
    _AGGREGATER += 'QUINHENTOS';
  } else if (a == 6) {
    _AGGREGATER += 'SEISCENTOS';
  } else if (a == 7) {
    _AGGREGATER += 'SETECENTOS';
  } else if (a == 8) {
    _AGGREGATER += 'OITOCENTOS';
  } else if (a == 9) {
    _AGGREGATER += 'NOVECENTOS';
  }

  if (b == 1) {
    if (c == 0) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DEZ';
    }
    if (c == 1) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'ONZE';
    }
    if (c == 2) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DOZE';
    }
    if (c == 3) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'TREZE';
    }
    if (c == 4) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'CATORZE';
    }
    if (c == 5) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'QUINZE';
    }
    if (c == 6) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DEZASSEIS';
    }
    if (c == 7) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DEZASSETE';
    }
    if (c == 8) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DEZOITO';
    }
    if (c == 9) {
      _AGGREGATER += ((a > 0) ? ' E ' : '') + 'DEZANOVE';
    }
  } else if (b == 2) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'VINTE');
  } else if (b == 3) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'TRINTA');
  } else if (b == 3) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'TRINTA');
  } else if (b == 4) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'QUARENTA');
  } else if (b == 5) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'CINQUENTA');
  } else if (b == 6) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'SESSENTA');
  } else if (b == 7) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'SETENTA');
  } else if (b == 8) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'OITENTA');
  } else if (b == 9) {
    _AGGREGATER += ((a > 0 ? ' E ' : '') + 'NOVENTA');
  }

  if(b!=1 && c!=0 && _AGGREGATER!=''){_AGGREGATER+=' E ';}
  if(b!=1){
    if(c==1){_AGGREGATER+='UM';}
    else if(c==2){_AGGREGATER+='DOIS';}
    else if(c==3){_AGGREGATER+='TRÊS';}
    else if(c==4){_AGGREGATER+='QUATRO';}
    else if(c==5){_AGGREGATER+='CINCO';}
    else if(c==6){_AGGREGATER+='SEIS';}
    else if(c==7){_AGGREGATER+='SETE';}
    else if(c==8){_AGGREGATER+='OITO';}
    else if(c==9){_AGGREGATER+='NOVE';}
  }

  return _AGGREGATER;
}
