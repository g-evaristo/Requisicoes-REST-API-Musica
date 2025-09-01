import 'package:flutter/material.dart';
import '../model/cantor.dart';
import '../controller/api_controller.dart';

class CadastroCantorPage extends StatelessWidget {
  final nomeController = TextEditingController();
  final dataController = TextEditingController();
  final fotoController = TextEditingController();
  final bioController = TextEditingController();

  void _salvarCantor(BuildContext context) async {
    final cantor = Cantor(
      nome: nomeController.text,
      dataNascimento: dataController.text,
      foto: fotoController.text,
      biografia: bioController.text,
    );
    await ApiController.postCantor(cantor);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cantor salvo com sucesso')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Cantor')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome')),
            TextField(controller: dataController, decoration: InputDecoration(labelText: 'Data de Nascimento')),
            TextField(controller: fotoController, decoration: InputDecoration(labelText: 'URL da Foto')),
            TextField(controller: bioController, decoration: InputDecoration(labelText: 'Biografia')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _salvarCantor(context), child: Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
