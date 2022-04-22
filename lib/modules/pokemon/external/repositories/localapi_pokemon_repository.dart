import 'dart:convert';

import '../../application/dtos/find_pokemon_input.dart';
import '../../application/repositories/i_pokemon_repository.dart';
import '../../domain/entities/pokemon_entity.dart';

// The local data for the repository.
const localApi = '''
  [
    {
      "id": 25,
      "name": "pikachu",
      "height": 4,
      "weight": 60,
      "types": [
        {
          "type": {
            "name": "electric"
          }
        }
      ],
      "sprites": {
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
      }
    }
  ]
''';

///
/// The local repository implementation.
///
class LocalApiPokemonRepository implements IPokemonRepository {
  @override
  Future<PokemonEntity> findOne(FindPokemonInput input) async {
    final response = List<Map<String, dynamic>>.from(json.decode(localApi));
    final data = response.where((e) => e['name'].contains(input.name.toLowerCase())).toList();
    return data.isNotEmpty ? PokemonEntity.fromMap(data.first) : PokemonEntity.empty();
  }
}
