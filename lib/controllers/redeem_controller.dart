import 'package:bin_band_group/models/redeem_model.dart';
import 'package:bin_band_group/services/api_service.dart';

class RedeemController {
  final ApiService _apiService = ApiService();

  Future<List<Redeem>> fetchRedeems() {
    return _apiService.fetchRedeems();
  }
}
