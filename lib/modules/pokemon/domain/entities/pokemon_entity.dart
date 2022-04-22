///
/// Rich domain with mappers and the enterprise business rules.
///
class PokemonEntity {
  const PokemonEntity(
    this._id,
    this._name,
    this._height,
    this._weight,
    this._types,
    this._image,
  );

  final int _id;
  int get id => _id;

  final String _name;
  String get name => _name;

  // According pokéapi, the pokémon height and weight must to be divided by 10 for correct meter and kilogram.
  final double _height;
  double get height => _height / 10;

  final double _weight;
  double get weight => _weight / 10;

  final List<String> _types;
  final String _image;

  List<String> get types => _types;
  String get image => _image;

  bool get isEmpty => id.isNaN || id <= 0;

  factory PokemonEntity.empty() => PokemonEntity(0, '', 0.0, 0.0, [], '');

  factory PokemonEntity.fromMap(Map<String, dynamic> map) {
    final mapTypes = List<Map<String, dynamic>>.from(map['types'] ?? []);
    final types = mapTypes.fold<List<String>>([], (v, e) {
      v.add(e['type']['name'].toString());
      return v;
    });
    return PokemonEntity(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['height']?.toDouble() ?? 0.0,
      map['weight']?.toDouble() ?? 0.0,
      types,
      map['sprites']['front_default'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map.addAll({'id': id});
    map.addAll({'name': name});
    map.addAll({'height': height});
    map.addAll({'weight': weight});
    map.addAll({'types': types});
    map.addAll({'image': image});
    return map;
  }

  PokemonEntity copyWith({
    int? id,
    String? name,
    double? height,
    double? weight,
    List<String>? types,
    String? image,
  }) {
    return PokemonEntity(
      id ?? this.id,
      name ?? this.name,
      height ?? this.height,
      weight ?? this.weight,
      types ?? this.types,
      image ?? this.image,
    );
  }
}
