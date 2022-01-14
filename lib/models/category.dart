import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String name;
  final int length;
  const CategoryModel({
    this.name = '',
    this.length = 0,
  });
  @override
  List<Object?> get props => [name, length];
}
