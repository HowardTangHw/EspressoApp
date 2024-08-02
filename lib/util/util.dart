import 'package:logger/logger.dart';

String formatNumber(int number) {
  if (number >= 10000) {
    double inThousands = number / 1000;
    return "${inThousands.toStringAsFixed(1)}k";
  } else {
    return number.toString();
  }
}

var logger = Logger(
  printer: PrettyPrinter(),
);
