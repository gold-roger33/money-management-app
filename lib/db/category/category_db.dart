import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:p_money_management/model/category/category_model.dart';


const CATEGORY_DB_NAME='category-database';

abstract class categorydbFunctions{

  Future<List<categoryModel>>getCategories();
  Future<void> insertcategory(categoryModel value);
  Future<void> deletecateegory(String categoryID);
}

  class categoryDB implements categorydbFunctions{

    categoryDB._internal();

    static categoryDB instance = categoryDB._internal();

    factory categoryDB(){
      return instance;
    }


    ValueNotifier<List<categoryModel>> incomecategorylistListener = ValueNotifier([]);
    ValueNotifier<List<categoryModel>> expensecategorylistListener = ValueNotifier([]);

  @override
  Future<void> insertcategory(categoryModel value) async{
   final _categoryDB =await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
   await _categoryDB.put(value.id,value);
   refreshUI();
  }
  
  @override
  Future<List<categoryModel>> getCategories() async {
    final _categoryDB =await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();

  }
  Future<void> refreshUI() async{
    final _allCategory = await getCategories();
    
    incomecategorylistListener.value.clear();
    expensecategorylistListener.value.clear();

    await Future.forEach(_allCategory, 
    (categoryModel category) {
      if (category.type==categoryType.income){
        incomecategorylistListener.value.add(category);
      }
      else{
        expensecategorylistListener.value.add(category);
      }
    });
    incomecategorylistListener.notifyListeners();
    expensecategorylistListener.notifyListeners();
  }
  
  @override
  Future<void> deletecateegory(String categoryID) async{
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.delete(categoryID);
    refreshUI();
  }

}