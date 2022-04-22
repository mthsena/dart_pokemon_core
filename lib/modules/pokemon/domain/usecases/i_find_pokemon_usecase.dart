import '../../application/dtos/find_pokemon_input.dart';
import '../../application/dtos/find_pokemon_output.dart';

abstract class IFindPokemonUseCase {
  Future<FindPokemonOutput> execute(FindPokemonInput input);
}
