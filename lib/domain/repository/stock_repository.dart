import 'package:flutter_stock_app/domain/model/company_listing.dart';
import 'package:flutter_stock_app/util/result.dart';

abstract class StockRepository {
  Future<Result<List<CompanyListing>>> getCompanyListings(
    bool fetchFromRemote,
    String query,
  );
}
