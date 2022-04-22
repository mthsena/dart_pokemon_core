///
/// The input requested by find pokémon use case.
///
class FindPokemonInput {
  const FindPokemonInput({
    required this.name,
  });

  final String name;

  FindPokemonInput copyWith({
    String? name,
  }) {
    return FindPokemonInput(
      name: name ?? this.name,
    );
  }
}
