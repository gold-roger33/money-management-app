import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:p_money_management/model/category/category_model.dart';


const CATEGORY_DB_NAME='category-database';

abstract class categorydbFunctions{

List<categoryModel>getCategories();
Future<void> insertcategory(categoryModel value);
}

class categoryDB implements categorydbFunctions{

  @override
  Future<Void> insertcategory(categoryModel value) async{
   final _categoryDB =await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
   await _categoryDB.add(value);
  }


}