import 'package:flutter/material.dart';
import 'package:p_money_management/screens/category/expense_cat.dart';
import 'package:p_money_management/screens/category/income_cat.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category>with SingleTickerProviderStateMixin {

  late TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return  Column(
    children: [
      TabBar(
        controller: _tabcontroller,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs:const [
        Tab(text: "Income",),
        Tab(text: "Expense"),
      ] 
      ),
      Expanded( 
        child: TabBarView(
          controller: _tabcontroller,
          children:const [
            incomecategorylist(),
            expensecategorylist()
          ]
          ),
      )
    ],
  );
  
  }
}