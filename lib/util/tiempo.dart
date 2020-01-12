
import 'package:intl/intl.dart';
String getFechaActual() {
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String fecha = formatter.format(now);
      return fecha;

}