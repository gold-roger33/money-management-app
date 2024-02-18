import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:p_money_management/db/transactions/transaction_model.dart';


const TRANSACTION_DB_NAME ='transaction-db';


abstract class Transactiondbfunction {
 
  Future<void> addTransaction(transactionModel obj);
  Future<List<transactionModel>> getallTansactions();
  Future<void>deleteTransaction(String id);
}


class TransactionDB implements Transactiondbfunction {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB(){
    return instance;
  }

  ValueNotifier<List<transactionModel>> transactionListNotifier=ValueNotifier([]);

 
  @override
  Future<void> addTransaction(transactionModel obj) async {
    final _db = await Hive.openBox<transactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
  }
  
  Future<void>refresh() async{
    final _list = await getallTansactions();
    _list.sort((first,second)=> first.date.compareTo(second.date));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
    transactionListNotifier.notifyListeners();
  }

  @override
  Future<List<transactionModel>> getallTansactions() async{
    
    final _db = await Hive.openBox<transactionModel>(TRANSACTION_DB_NAME);

    return _db.values.toList();
  }
  
  @override
  Future<void> deleteTransaction(String id) async {
    final _db = await Hive.openBox<transactionModel>(TRANSACTION_DB_NAME);
    await _db.delete(id);
    refresh();
  }

 
}
