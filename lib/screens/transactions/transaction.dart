import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/db/transactions/transaction_db.dart';
import 'package:p_money_management/db/transactions/transaction_model.dart';
import 'package:p_money_management/model/category/category_model.dart';
import 'package:p_money_management/screens/category/income_cat.dart';

class transactions extends StatelessWidget {
  const transactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    categoryDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable:TransactionDB.instance.transactionListNotifier,
     builder: (BuildContext ctx, List<transactionModel> newList, Widget?_){

     return ListView.separated(
      padding:const EdgeInsets.all(10),
      itemBuilder:(ctx,index){
        final _value = newList[index];

      return   Slidable(
        key: Key(_value.id!),
        startActionPane:ActionPane(
          motion:ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx){
                TransactionDB.instance.deleteTransaction(_value.id!);
              },
              icon: Icons.delete,
              label: "Delete",)
          ]
          ) ,
        child: Stack(
          children: [
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  child: Text(
                   parseDate(_value.date),
                   textAlign: TextAlign.center,
                   ),
                   backgroundColor:_value.type == categoryType.income 
                   ?Colors.green
                   : Colors.red),
            
                title: Text('RS ${_value.amount}'),
                subtitle: Text(_value.category.name),
              ),
            ),
          ],
        ),
      );
    },
     separatorBuilder: (ctx,index){
      return const SizedBox(height: 10);
     },
     itemCount: newList.length);
     }
     );
     }

     String parseDate(DateTime date){
      final _date = DateFormat.MMMd().format(date);
      final _splitddate = _date.split(' ');
      return '${_splitddate.last}\n ${_splitddate.first}';
      //return '${date.day}\n ${date.month}';
     }
}