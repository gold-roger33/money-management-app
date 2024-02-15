import 'package:flutter/material.dart';
import 'package:p_money_management/screens/home/home.dart';

class moneybottomnavigation extends StatelessWidget {
  const moneybottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: screenhome.selectedindexnotifier,
      builder: (BuildContext ctx, int updatedindex, widget_) {
       return BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: updatedindex,
        onTap: (newindex){
          screenhome.selectedindexnotifier.value=newindex;
        },
      
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Transactions'),
      
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Category'),
      ]);
      },
    );
  }
}
