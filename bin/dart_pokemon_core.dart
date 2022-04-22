import 'package:dart_pokemon_core/dart_pokemon_core.dart';

void main() async {
  final pokemonRepository = PokeApiPokemonRepository();
  final findPokemonUseCase = FindPokemonUseCase(pokemonRepository);
  final findPokemonInput = FindPokemonInput(name: 'lapras');
  final response = await findPokemonUseCase.execute(findPokemonInput);
  print(response.toJson());
}
