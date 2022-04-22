import 'package:dio/dio.dart';

import '../../application/dtos/find_pokemon_input.dart';
import '../../application/repositories/i_pokemon_repository.dart';
import '../../domain/entities/pokemon_entity.dart';

///
/// The pokéapi repository implementation.
///
class PokeApiPokemonRepository implements IPokemonRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2',
  ));

  @override
  Future<PokemonEntity> findOne(FindPokemonInput input) async {
    final response = await _dio.get('/pokemon/${input.name}');
    final data = Map<String, dynamic>.from(response.data);
    return data.isNotEmpty ? PokemonEntity.fromMap(data) : PokemonEntity.empty();
  }
}
