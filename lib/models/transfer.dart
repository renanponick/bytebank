class Transfer {
  final int id;
  final double valor;
  final int accountNumber;

  Transfer(
    this.id,
    this.valor,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transferencia{id: $id, valor: $valor, accountNumber $accountNumber}';
  }
}
