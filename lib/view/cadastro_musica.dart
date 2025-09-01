import 'package:flutter/material.dart';
import '../model/musica.dart';
import '../model/cantor.dart';
import '../controller/api_controller.dart';

class CadastroMusicaPage extends StatefulWidget {
  @override
  _CadastroMusicaPageState createState() => _CadastroMusicaPageState();
}

class _CadastroMusicaPageState extends State<CadastroMusicaPage> {
  final tituloController = TextEditingController();
  final duracaoController = TextEditingController();
  final capaController = TextEditingController();

  List<Cantor> cantores = [];
  Cantor? cantorSelecionado;

  @override
  void initState() {
    super.initState();
    carregarCantores();
  }

  Future<void> carregarCantores() async {
    try {
      final lista = await ApiController.fetchCantores();
      print('Cantores carregados: ${lista.map((c) => c.nome).toList()}');
      setState(() {
        cantores = lista;
      });
    } catch (e) {
      print('Erro ao carregar cantores: $e');
    }
  }

  void _salvarMusica() async {
    if (cantorSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione um cantor')),
      );
      return;
    }

    final novaMusica = Musica(
      titulo: tituloController.text,
      duracao: duracaoController.text,
      capa: capaController.text,
      nome: cantorSelecionado!.nome,
    );

    await ApiController.postMusica(novaMusica);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Música cadastrada com sucesso')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Música')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: tituloController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: duracaoController,
                decoration: InputDecoration(labelText: 'Duração'),
              ),
              TextField(
                controller: capaController,
                decoration: InputDecoration(labelText: 'URL da Capa'),
              ),
              DropdownButtonFormField<Cantor>(
                value: cantorSelecionado,
                items: cantores.map((cantor) {
                  return DropdownMenuItem<Cantor>(
                    value: cantor,
                    child: Text(cantor.nome),
                  );
                }).toList(),
                onChanged: (valor) {
                  setState(() {
                    cantorSelecionado = valor;
                  });
                },
                decoration: InputDecoration(labelText: 'Selecione o Cantor'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarMusica,
                child: Text('Salvar Música'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
