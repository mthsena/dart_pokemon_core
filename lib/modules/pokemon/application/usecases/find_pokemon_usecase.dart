import 'package:dio/dio.dart';

import '../../domain/usecases/i_find_pokemon_usecase.dart';
import '../dtos/find_pokemon_input.dart';
import '../dtos/find_pokemon_output.dart';
import '../errors/pokemon_empty_error.dart';
import '../errors/pokemon_not_found_error.dart';
import '../repositories/i_pokemon_repository.dart';

///
/// The find pokémon use case implementation.
///
class FindPokemonUseCase implements IFindPokemonUseCase {
  const FindPokemonUseCase(this._pokemonRepository);

  final IPokemonRepository _pokemonRepository;

  @override
  Future<FindPokemonOutput> execute(FindPokemonInput input) async {
    try {
      if (input.name.isEmpty) throw PokemonEmptyError();
      final pokemon = await _pokemonRepository.findOne(input.copyWith(name: input.name.toLowerCase()));
      if (pokemon.isEmpty) throw PokemonNotFoundError();
      return FindPokemonOutput.success('Pokémon successfully obtained!', pokemon.toMap());
    } on PokemonNotFoundError {
      return FindPokemonOutput.failure('Pokémon not found.');
    } on PokemonEmptyError {
      return FindPokemonOutput.failure('Pokémon name is empty.');
    } on DioError {
      return FindPokemonOutput.failure('Pokémon not found.');
    }
  }
}
