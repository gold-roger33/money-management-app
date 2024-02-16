import 'package:flutter/material.dart';
import 'package:p_money_management/db/category/category_db.dart';
import 'package:p_money_management/model/category/category_model.dart';

ValueNotifier<categoryType> selectedcategoryNotifier = ValueNotifier(categoryType.income);

Future<void> showcategoryaddpopup(BuildContext context) async {
  final _nameeditingController= TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text("add category"),
          children: [
            TextFormField(
              controller: _nameeditingController,
              decoration: const InputDecoration(
                hintText: "category name",
                border: OutlineInputBorder(),
              ),
            ),

          const Padding(padding: EdgeInsets.all(8.0),
    
             child: Row(children: [
              Radiobutton(title: "income", type:categoryType.income),
              Radiobutton(title: "expense", type:categoryType.expense)
                       ],),
           ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                final _name=_nameeditingController.text;
                if(_name.isEmpty)
                {
                  return;
                }
                final _type = selectedcategoryNotifier.value;
                final _category = categoryModel(id: DateTime.now().millisecondsSinceEpoch.toString(),
                 name: _name,
                  type: _type
                  );

                  categoryDB.instance.insertcategory(_category);
                  Navigator.of(ctx).pop();
              },
               child: const Text("add")),
            )
          ],
        );
      });
}


class Radiobutton extends StatelessWidget {
  final String title;
  final categoryType type;

  const Radiobutton({
  Key? key,
  required this.title,
  required this.type,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(valueListenable: selectedcategoryNotifier,
         builder: (BuildContext ctx,categoryType newcategory, Widget? _){
          return  Radio<categoryType>(
          value: type,
          groupValue:newcategory, 
          onChanged: (value) {
            if(value==null){ 
              return;
            }
            selectedcategoryNotifier.value = value;
            selectedcategoryNotifier.notifyListeners();
            
          }
          );
         }),
        Text(title)
      ],
    );
  }
}