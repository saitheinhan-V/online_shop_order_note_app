import 'package:floor/floor.dart';
@entity
class ItemSize{
  @PrimaryKey(autoGenerate: true)
  final int sizeId;
  final String sizeName;
  ItemSize(this.sizeId, this.sizeName);
}