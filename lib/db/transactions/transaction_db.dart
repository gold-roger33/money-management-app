import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_money_management/db/transactions/transaction_model.dart';


const TRANSACTION_DB_NAME ='transaction-db';


abstract class Transactiondbfunction {
  // Define the method signature
  Future<void> addTransaction(transactionModel obj);
}


class TransactionDB implements Transactiondbfunction {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB(){
    return instance;
  }
 
  @override
  Future<void> addTransaction(transactionModel obj) async {
    final _db = await Hive.openBox<transactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
  }

 
}
