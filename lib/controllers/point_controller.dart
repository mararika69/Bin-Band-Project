
import 'package:bin_band_group/models/point_model.dart';
import 'package:bin_band_group/services/api_service.dart';

class PointController {
  final ApiService _apiService = ApiService();

  Future<List<Point>> fetchPoints() {
    return _apiService.fetchPoints();
  }
}
