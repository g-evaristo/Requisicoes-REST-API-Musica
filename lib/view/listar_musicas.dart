import 'package:flutter/material.dart';
import '../controller/api_controller.dart';
import '../model/musica.dart';

class ListaMusicasPage extends StatefulWidget {
  @override
  _ListaMusicasPageState createState() => _ListaMusicasPageState();
}

class _ListaMusicasPageState extends State<ListaMusicasPage> {
  late Future<List<Musica>> _musicasFuture;

  @override
  void initState() {
    super.initState();
    _musicasFuture = ApiController.fetchMusicas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🎵 Músicas Cadastradas')),
      body: FutureBuilder<List<Musica>>(
        future: _musicasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text('Erro ao carregar músicas'));

          final musicas = snapshot.data!;
          if (musicas.isEmpty)
            return Center(child: Text('Nenhuma música cadastrada'));

          return ListView.builder(
            itemCount: musicas.length,
            itemBuilder: (context, index) {
              final musica = musicas[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Image.network(
                    musica.capa,
                    width: 50,
                    errorBuilder: (_, __, ___) => Icon(Icons.music_note),
                  ),
                  title: Text(musica.titulo),
                  subtitle: Text(
                    'Duração: ${musica.duracao}\nCantor: ${musica.nome}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
