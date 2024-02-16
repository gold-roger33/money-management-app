import 'package:hive/hive.dart';
import 'package:p_money_management/model/category/category_model.dart';


const CATEGORY_DB_NAME='category-database';

abstract class categorydbFunctions{

  Future<List<categoryModel>>getCategories();
  Future<void> insertcategory(categoryModel value);
}

  class categoryDB implements categorydbFunctions{
  @override
  Future<void> insertcategory(categoryModel value) async{
   final _categoryDB =await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
   await _categoryDB.add(value);
  }
  
  @override
  Future<List<categoryModel>> getCategories() async {
    final _categoryDB =await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();

  }


}