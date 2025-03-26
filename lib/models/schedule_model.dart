class PickupRequest {
  final String date;
  final List<String> wasteTypes;
  final double estimateWeight;
  final bool recurring;

  PickupRequest({
    required this.date,
    required this.wasteTypes,
    required this.estimateWeight,
    required this.recurring,
  });

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "wasteTypes": wasteTypes,
      "estimateWeight": estimateWeight,
      "recurring": recurring,
    };
  }
}
