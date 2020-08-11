class BalanceTransactions {
  final String mes;
  final List<Dia> dia;

  BalanceTransactions({this.mes, this.dia});
}

class Dia {
  final String data;
  final List<Transaction> transactions;

  Dia({this.data, this.transactions});
}

class Transaction {
  final double price;
  final Destinatario destinatario;
  final TranType tipoTransaferencia;

  Transaction(this.tipoTransaferencia, {this.price, this.destinatario});
}

class Destinatario {
  final String nome;
  final String conta;

  Destinatario({this.nome, this.conta});
}

enum TranType {
  adicionar,
  remover,
}
