import 'dart:convert';

///
/// The output data that came from find pokémon use case.
///
class FindPokemonOutput {
  const FindPokemonOutput({
    required this.status,
    required this.message,
    required this.output,
  });

  final String status;
  final String message;
  final Map<String, dynamic> output;

  factory FindPokemonOutput.failure(String message) => FindPokemonOutput(status: 'failure', message: message, output: {});
  factory FindPokemonOutput.success(String message, Map<String, dynamic> output) => FindPokemonOutput(status: 'success', message: message, output: output);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'output': output});
    return result;
  }

  factory FindPokemonOutput.fromMap(Map<String, dynamic> map) {
    return FindPokemonOutput(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      output: Map<String, dynamic>.from(map['output'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory FindPokemonOutput.fromJson(String source) => FindPokemonOutput.fromMap(json.decode(source));
}
