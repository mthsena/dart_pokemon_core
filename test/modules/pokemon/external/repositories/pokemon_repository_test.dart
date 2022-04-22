import 'package:dart_pokemon_core/modules/pokemon/application/dtos/find_pokemon_input.dart';
import 'package:dart_pokemon_core/modules/pokemon/application/repositories/i_pokemon_repository.dart';
import 'package:dart_pokemon_core/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class PokemonRepositoryMock extends Mock implements IPokemonRepository {}

void main() {
  late IPokemonRepository _pokemonRepository;

  setUpAll(() {
    _pokemonRepository = PokemonRepositoryMock();
  });

  group('Pokémon repository find', () {
    test('should return a pikachu', () async {
      final input = FindPokemonInput(name: 'PIKACHU');
      final findOne = _pokemonRepository.findOne;
      final answer = PokemonEntity(25, 'pikachu', 0, 0, [], '');
      when(() => findOne(input)).thenAnswer((_) async => answer);
      final result = await findOne(input);
      expect(result.id, 25);
      expect(result.name, 'pikachu');
    });

    test('should not return a bulbasaur', () async {
      final input = FindPokemonInput(name: 'BULBASAUR');
      final findOne = _pokemonRepository.findOne;
      final answer = PokemonEntity(0, '', 0, 0, [], '');
      when(() => findOne(input)).thenAnswer((_) async => answer);
      final result = await findOne(input);
      expect(result.id, isNot(1));
      expect(result.name, isNot('bulbasaur'));
    });
  });
}
