class Transaction {
  final int id;
  final String name;
  final double price;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.name,
      required this.price,
      required this.date});
}
