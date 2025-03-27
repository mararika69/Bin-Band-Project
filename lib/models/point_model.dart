

class Point {
  final String totalPoints;
  final String cashEquivalent;


  Point({
    required this.totalPoints,
    required this.cashEquivalent,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      totalPoints: json['totalPoints'] ?? '',
      cashEquivalent: json['cashEquivalent'] ?? '',
    );
  }

  bool? get isEmpty => null;

  Map<String, dynamic> toJson() {
    return {
      'totalPoints': totalPoints,
      'cashEquivalent': cashEquivalent,
    };
  }
}