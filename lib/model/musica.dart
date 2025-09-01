class Musica {
  final String titulo;
  final String duracao;
  final String capa;
  final String nome;

  Musica({required this.titulo, required this.duracao, required this.capa, required this.nome});

  factory Musica.fromJson(Map<String, dynamic> json) {
    return Musica(
      titulo: json['titulo'],
      duracao: json['duracao'],
      capa: json['capa'],
      nome: json['nome']
    );
  }

  Map<String, dynamic> toJson() => {
        'titulo': titulo,
        'duracao': duracao,
        'capa': capa,
        'nome': nome
      };
}
