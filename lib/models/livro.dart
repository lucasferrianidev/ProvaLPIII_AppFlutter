class Livro {
  final String nome;
  final String estado;
  final int nota;

  Livro(
      this.nome,
      this.estado,
      this.nota,
      );

  @override
  String toString() {
    return 'Livro{nome: $nome, estado: $estado, nota: $nota}';
  }
}
