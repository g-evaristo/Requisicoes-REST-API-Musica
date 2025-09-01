class Cantor {
  final String nome;
  final String dataNascimento;
  final String foto;
  final String biografia;

  Cantor({required this.nome, required this.dataNascimento, required this.foto, required this.biografia});

  factory Cantor.fromJson(Map<String, dynamic> json) {
    return Cantor(
      nome: json['nome']?.toString() ?? '',
      dataNascimento: json['data_nascimento']?.toString() ?? '',
      foto: json['foto']?.toString() ?? '',
      biografia: json['biografia']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'data_nascimento': dataNascimento,
        'foto': foto,
        'biografia': biografia,
      };
}
