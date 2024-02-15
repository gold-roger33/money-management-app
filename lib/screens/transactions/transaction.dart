import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class transactions extends StatelessWidget {
  const transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder:(ctx,index){
      return const Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 50,
            child: Text('12\n dec',textAlign: TextAlign.center,)),
          title: Text('RS 1000'),
          subtitle: Text('travel'),
        ),
      );
    },
     separatorBuilder: (ctx,index){
      return const SizedBox(height: 10);
     },
     itemCount: 10);
     }
}