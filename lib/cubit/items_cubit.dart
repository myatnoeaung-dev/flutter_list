import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsState.loading());

  // Future<void> addItems(String item) async {
  //   print(item);
  //   List<String> i = [];
  //   i.addAll(state.items);
  //   emit(ItemsState.failure());
  // }

  Future<void> fetchItems() async {
    List<String> list = ["2", "3"];
    emit(ItemsState.success(list));
  }

  Future<void> add(String value) async {

    var i=List.of(state.items!)..add(value);
    emit(ItemsState.success(i));
  }
}
