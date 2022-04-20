class Transfer {
  final double valor;
  final int conta;

  Transfer(
    this.valor,
    this.conta,
  );

  @override
  String toString() {
    return 'Transferencia{valor: $valor, conta $conta}';
  }
}
