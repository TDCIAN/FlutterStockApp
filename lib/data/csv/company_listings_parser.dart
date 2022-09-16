import 'package:csv/csv.dart';
import 'package:flutter_stock_app/data/csv/csv_parser.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';

class CompanyListingsParer implements CsvParser<CompanyListing> {
  @override
  Future<List<CompanyListing>> parse(String csvString) async {
    List<List<dynamic>> csvValues =
        const CsvToListConverter().convert(csvString);
    csvValues.removeAt(0);
    return csvValues
        .map((e) {
          final symbol = e[0] ?? '';
          final name = e[1] ?? '';
          final exchange = e[2] ?? '';
          return CompanyListing(
            symbol: symbol,
            name: name,
            exchange: exchange,
          );
        })
        .where((element) =>
            element.symbol.isNotEmpty &&
            element.name.isNotEmpty &&
            element.exchange.isNotEmpty)
        .toList();
  }
}
