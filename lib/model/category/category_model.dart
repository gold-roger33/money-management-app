import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
enum categoryType{
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class categoryModel{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final categoryType type;

  categoryModel(
  {  
    required this.id,
    required this.name,
    this.isDeleted=false,
    required this.type
  }
   );
}