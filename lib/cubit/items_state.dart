part of 'items_cubit.dart';

enum States { loading, success, failure }

class ItemsState extends Equatable {
  final States itemStates;
  final List<String>? items;

  ItemsState({this.itemStates = States.loading, this.items});

  ItemsState.loading() : this();

  ItemsState.success(List<String> items)
      : this(itemStates: States.success, items: items);

  ItemsState.failure() : this(itemStates: States.failure);

  @override
  List<Object?> get props => [itemStates, items];
}
