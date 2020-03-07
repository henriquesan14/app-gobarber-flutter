import 'package:app_gobarber/consts/consts_app.dart';

class DateUtils {
  
  static String dataExtenso(date){
    DateTime dateParsed = DateTime.parse(date).subtract(Duration(hours: 3));
    DateTime dataAtual = DateTime.now();
    DateTime dateParsedSemHour = DateTime(dateParsed.year, dateParsed.month, dateParsed.day, 0, 0, 0);
    DateTime dateAtualSemHour = DateTime(dataAtual.year, dataAtual.month, dataAtual.day, 0, 0, 0);
    int diff = dateParsedSemHour.difference(dateAtualSemHour).inDays;
    if(diff == 0){
        return "Hoje às ${addZero(dateParsed.hour)}:${addZero(dateParsed.minute)}"; 
    }else if(diff == 1){
        return "Amanhã às ${addZero(dateParsed.hour)}:${addZero(dateParsed.minute)}";
    }else if(diff == -1){
        return "Ontem às ${addZero(dateParsed.hour)}:${addZero(dateParsed.minute)}";
    }
    return "Dia ${addZero(dateParsed.day)} de ${ConstsApp.MONTHS[dateParsed.month -1]} às ${addZero(dateParsed.hour)}:${addZero(dateParsed.minute)} ";
  }

  static String addZero(value){
    String str = value.toString();
    if(str.length == 1){
      return "0" + value.toString();
    }
    return str;
  }
}