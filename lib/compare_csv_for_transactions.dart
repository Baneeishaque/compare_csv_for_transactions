import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

//int calculate() {
//  return 6 * 7;
//}

Future<List<dynamic>> readCsv() async {
  final input = File(r'bin\4356XXXXXXXXX854505-07-2018 (1).csv').openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(CsvToListConverter())
      .toList();
//  print(fields);
  return fields;
}

void printTransactions(List<dynamic> csvAsList) {
  var transactions = (csvAsList[0] as List<dynamic>).skip(199).take(33).toList();
  print(transactions);
}

void printTransactionsFromCsv() async {

  printTransactions(await readCsv());
}
