import 'package:ProvaLPIII/screens/lista_livros.dart';
import 'package:flutter/material.dart';
import 'package:ProvaLPIII/models/livro.dart';

void main() => runApp(ProvaLPIIIapp());

class ProvaLPIIIapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaLivros(),
    );
  }
}

class Customer {
  String name;
  int age;

  Customer(this.name, this.age);

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}