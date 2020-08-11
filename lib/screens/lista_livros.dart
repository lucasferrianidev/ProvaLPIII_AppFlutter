import 'package:ProvaLPIII/models/livro.dart';
import 'package:ProvaLPIII/screens/formulario_livros.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Meus Livros';

// a lista de livros e Stateful pois é uma listagem dinâmica e seu
// estado deve ser guardado, o build será executado todas as vezes
// que a lista for chamada
class ListaLivros extends StatefulWidget {
  // collection de livros, alguns previamente cadastrados em memória
  final List<Livro> _livros = [
    Livro('Harry Potter', 'Lido', 2),
    Livro('Senhor dos Anéis', 'Lido', 1),
    Livro('Análise Preditiva', 'Lendo', 1),
    Livro('Negócios Digitais', 'Lendo', 0),
  ];

  @override
  State<StatefulWidget> createState() {
    return ListaLivrosState();
  }
}

class ListaLivrosState extends State<ListaLivros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._livros.length,
        itemBuilder: (context, indice) {
          final livro = widget._livros[indice];
          //_inicializa();
          return ItemLivro(livro);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // empilha a tela de formulario
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioLivro();
            // somente após clicar em gravar no formulário lança o then
          })).then(
            (livroRecebido) => _atualiza(livroRecebido),
          );
        },
      ),
    );
  }

  void _atualiza(Livro livroRecebido) {
    if (livroRecebido != null) {
      setState(() {
        widget._livros.add(livroRecebido);
      });
    }
  }
}

class ItemLivro extends StatelessWidget {
  final Livro _livro;

  ItemLivro(this._livro);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: ListTile(
        leading: (_livro.nota == 0
            ? Icon(Icons.star_border, size: 42.0, color: Colors.blue)
            : _livro.nota == 1
                ? Icon(Icons.star_half, size: 42.0, color: Colors.blue)
                : Icon(Icons.star, size: 42.0, color: Colors.blue)),
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text.rich(TextSpan(
              text: _livro.nome.toString(),
              style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        subtitle: Text.rich(TextSpan(
            text: _livro.estado.toString(),
            style: TextStyle(color: Colors.grey[700]))),
        //dense: true,
      ),
    );
  }
}
