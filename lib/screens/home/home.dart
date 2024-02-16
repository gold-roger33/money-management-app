import 'package:flutter/material.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/model/category/category_model.dart';
import 'package:p_money_management/screens/category/add_popup.dart';
import 'package:p_money_management/screens/category/category.dart';
import 'package:p_money_management/screens/home/widgets/bottom_nav.dart';
import 'package:p_money_management/screens/transactions/transaction.dart';

class screenhome extends StatelessWidget {
  const screenhome({super.key});

    static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);

    final _pages = const[
      transactions(),
      category()
    ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Money manager'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: moneybottomnavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedindexnotifier,
         builder: (BuildContext context,int updatedindex,_) {
          return _pages[updatedindex];
         }
         )
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          if (selectedindexnotifier.value==0){
          print("add Transations");
        }
        else
        {
          print('add category');

          showcategoryaddpopup(context);

        /*  final _sample= categoryModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
           name: "travel",
            type: categoryType.expense,
            );
          categoryDB().insertcategory(_sample); */
          }
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}