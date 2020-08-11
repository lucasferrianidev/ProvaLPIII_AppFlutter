import 'package:ProvaLPIII/components/caixa_de_texto.dart';
import 'package:ProvaLPIII/models/livro.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Cadastrando Livro';
const _rotuloNome = 'Nome do livro';
const _estadoInicialdoLivro = 'Lendo';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioLivro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioLivroState();
  }
}

class FormularioLivroState extends State<FormularioLivro> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNota = TextEditingController();
  int _classificacao = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CaixaDeTexto(
                controlador: _controladorCampoNome,
                rotulo: _rotuloNome,
              ),
              ListTile(
                title: const Icon(Icons.star_border, size: 42.0, color: Colors.blue),
                leading: Radio(
                  value: 0,
                  groupValue: _classificacao,
                  onChanged: (int value) {
                    setState(() {
                      _classificacao = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Icon(Icons.star_half, size: 42.0, color: Colors.blue),
                leading: Radio(
                  value: 1,
                  groupValue: _classificacao,
                  onChanged: (int value) {
                    setState(() {
                      _classificacao = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Icon(Icons.star, size: 42.0, color: Colors.blue),
                leading: Radio(
                  value: 2,
                  groupValue: _classificacao,
                  onChanged: (int value) {
                    setState(() {
                      _classificacao = value;
                    });
                  },
                ),
              ),
              RaisedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaLivro(context),
              ),
            ],
          ),
        ));
  }

  void _criaLivro(BuildContext context) {
    final String nome = _controladorCampoNome.text;
    final String estado = _estadoInicialdoLivro;
    final int nota = _classificacao;
    if (nome != null && nome != '' && nota != null) {
      final livroCriado = Livro(nome, estado, nota);
      Navigator.pop(context, livroCriado);
    }
  }
}
