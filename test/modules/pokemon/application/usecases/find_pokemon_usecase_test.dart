import 'package:dart_pokemon_core/dart_pokemon_core.dart';
import 'package:dart_pokemon_core/modules/pokemon/application/repositories/i_pokemon_repository.dart';
import 'package:test/test.dart';

void main() {
  late IPokemonRepository _pokemonRepository;
  late IFindPokemonUseCase _findPokemonUseCase;

  setUpAll(() {
    _pokemonRepository = LocalApiPokemonRepository();
    _findPokemonUseCase = FindPokemonUseCase(_pokemonRepository);
  });

  group('Find pokémon use case', () {
    test('should return a pokémon empty failure output', () async {
      final result = await _findPokemonUseCase.execute(FindPokemonInput(name: ''));
      expect(result.status, 'failure');
      expect(result.message, 'Pokémon name is empty.');
    });

    test('should return a pokémon not found failure output', () async {
      final result = await _findPokemonUseCase.execute(FindPokemonInput(name: 'Lorem ipsum dolor sit amet'));
      expect(result.status, 'failure');
      expect(result.message, 'Pokémon not found.');
    });

    test('should return a pokémon success output', () async {
      final result = await _findPokemonUseCase.execute(FindPokemonInput(name: 'PIKACHU'));
      expect(result.status, 'success');
      expect(result.output, isNotEmpty);
    });
  });
}
