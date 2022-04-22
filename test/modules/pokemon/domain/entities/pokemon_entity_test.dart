import 'package:dart_pokemon_core/modules/pokemon/domain/entities/pokemon_entity.dart';
import 'package:test/test.dart';

void main() {
  late PokemonEntity _pokemonEntity;

  setUpAll(() {
    _pokemonEntity = PokemonEntity(0, '', 4, 60, [], '');
  });

  group('Pokémon entity', () {
    test('should not return a valid pokémon entity', () {
      expect(_pokemonEntity.isEmpty, true);
    });

    test('should return a valid pokémon height', () {
      expect(_pokemonEntity.height, 0.4);
    });

    test('should return a valid pokémon weight', () {
      expect(_pokemonEntity.weight, 6);
    });
  });
}
