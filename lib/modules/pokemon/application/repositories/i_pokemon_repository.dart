import '../../domain/entities/pokemon_entity.dart';
import '../dtos/find_pokemon_input.dart';

///
/// The pokémon repository template.
///
abstract class IPokemonRepository {
  Future<PokemonEntity> findOne(FindPokemonInput input);
}
