class Address {
  final int id;
  final String country;
  final String oblast;
  final String cityVillage;
  final String street;
  final String house;
  final String? apartment;

  const Address({
    required this.id,
    required this.country,
    required this.oblast,
    required this.cityVillage,
    required this.street,
    required this.house,
    this.apartment,
  });

  // fromJson factory method
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int,
      country: json['country'] as String,
      oblast: json['oblast'] as String,
      cityVillage: json['city_village'] as String,
      street: json['street'] as String,
      house: json['house'] as String,
      apartment: json['apartment'] as String?,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'oblast': oblast,
      'city_village': cityVillage,
      'street': street,
      'house': house,
      'apartment': apartment,
    };
  }

  // copyWith method
  Address copyWith({
    int? id,
    String? country,
    String? oblast,
    String? cityVillage,
    String? street,
    String? house,
    String? apartment,
  }) {
    return Address(
      id: id ?? this.id,
      country: country ?? this.country,
      oblast: oblast ?? this.oblast,
      cityVillage: cityVillage ?? this.cityVillage,
      street: street ?? this.street,
      house: house ?? this.house,
      apartment: apartment ?? this.apartment,
    );
  }
}
