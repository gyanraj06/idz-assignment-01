class Info {
  final String name;
  final String email;
  final String month;

  final int date;
  final int year;

  Info({
    required this.name,
    required this.email,
    required this.month,
    required this.date,
    required this.year,
  });

  factory Info.fromSqfliteDatabase(Map<String, dynamic> map) => Info(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        month: map['month'] ?? '',
        date: map['date']?.toInt() ?? 0,
        year: map['year']?.toInt() ?? 0,
      );
}
