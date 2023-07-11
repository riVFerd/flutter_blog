import 'package:bloc/bloc.dart';
import 'package:flutter_blog/logic/models/category_model.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoriesLoading());
      try {
        emit(CategoriesLoaded(categories: await CategoryModel.getCategories())); 
      } catch (e) {
        emit(CategoriesError());
      }
    });
  }
}
