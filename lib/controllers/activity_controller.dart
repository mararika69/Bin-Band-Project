import 'package:bin_band_group/models/activity_controller.dart';
import 'package:bin_band_group/services/api_service.dart';

class ActivityController {
  final ApiService _apiService = ApiService();
  
  Future<List<Activity>> fetchActivities() {
    return _apiService.fetchActivities();
  }
}
