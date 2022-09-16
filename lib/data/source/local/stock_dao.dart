import 'package:flutter_stock_app/data/source/local/company_listing_entity.dart';
import 'package:hive/hive.dart';

class StockDao {
  static const companyListing = 'companyListing';
  final box = Hive.box('stock.db');

  // 추가
  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntity) async {
    await box.put(StockDao.companyListing, companyListingEntity);
  }

  // 클리어
  Future<void> clearCompanyListings() async {
    await box.clear();
  }

  // 검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final List<CompanyListingEntity> companyListing =
        box.get(StockDao.companyListing, defaultValue: []);

    return companyListing
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            query.toUpperCase() == element.symbol)
        .toList();
  }
}
