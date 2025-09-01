import 'package:flutter/material.dart';
import 'view/home_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cadastro de Música e Cantor',
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}
