import 'package:flutter/material.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/model/category/category_model.dart';
import 'package:p_money_management/screens/category/category.dart';

class expensecategorylist extends StatelessWidget {
  const expensecategorylist({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: categoryDB().expensecategorylistListener , 
     builder: (BuildContext ctx, List<categoryModel>newlist, Widget?_) {
      return ListView.separated(
      itemBuilder: (ctx,index){
        final category = newlist[index];
     return  Card(
       child: ListTile(
        title: Text(category.name),
        trailing: IconButton(onPressed: (){
          categoryDB.instance.deletecateegory(category.id);
        }, 
        icon: const Icon(Icons.delete)
        ),
       ),
     );

    }, 
    separatorBuilder: (ctx,index){
      return const SizedBox(height: 10);
    },
     itemCount:newlist.length);
     }
     );
    
    }
}