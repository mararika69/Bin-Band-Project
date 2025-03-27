import 'package:bin_band_group/services/api_service.dart';
import 'package:bin_band_group/models/schedule_model.dart';

class ScheduleController {
  final ApiService _apiService = ApiService();

  Future<List<ScheduleModel>> createNewSchedule({
    required String userId,
    required String date,
    required List<String> wasteTypes,
    required double estimateWeight,
    required bool recurring,
  }) async {
    return await _apiService.createNewSchedule(
      userId: userId,
      date: date,
      wasteTypes: wasteTypes.isNotEmpty ? wasteTypes : [],
      estimateWeight: estimateWeight,
      recurring: recurring,
    );
  }
}