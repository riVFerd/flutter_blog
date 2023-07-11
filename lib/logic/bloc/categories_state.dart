part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  CategoriesLoaded({required this.categories});

  final List<CategoryModel> categories;
}

class CategoriesError extends CategoriesState {}