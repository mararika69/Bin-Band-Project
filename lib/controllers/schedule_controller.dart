// import '../models/schedule_model.dart';
// import '../services/api_service.dart';

// class PickupController {
//   final ApiService _apiService = ApiService();

//   Future<bool> createPickup({
//     required String date,
//     required List<String> wasteTypes,
//     required double estimateWeight,
//     required bool recurring,
//   }) async {
//     PickupRequest pickup = PickupRequest(
//       date: date,
//       wasteTypes: wasteTypes,
//       estimateWeight: estimateWeight,
//       recurring: recurring,
//     );

//     return await _apiService.schedulePickup(pickup);
//   }
// }
