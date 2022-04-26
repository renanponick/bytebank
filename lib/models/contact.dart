class Contact {
  final String name;
  final int number;

  Contact(
    this.name,
    this.number,
  );

  @override
  String toString() {
    return 'Transferencia{Nome: $name, Numero $number}';
  }
}
