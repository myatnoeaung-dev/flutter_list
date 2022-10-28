import 'package:bloc_items_test/cart.dart';
import 'package:bloc_items_test/cubit/items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
//    context.read<ItemsCubit>().fetchItems();
    BlocProvider.of<ItemsCubit>(context).fetchItems();

    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: ComplexListView(),
    );
  }
}

class ComplexListView extends StatelessWidget {
  const ComplexListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ItemsCubit>().state;
    print("${state.itemStates} state in page");
    switch (state.itemStates) {
      case States.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case States.success:
        if (state.items != null) {
          return Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CartPage();
                    }));
                  },
                  child: Text("Next")),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<ItemsCubit>(context).add("hello");
                  },
                  icon: Icon(Icons.add)),
              Expanded(
                child: ListView(children: [
                  ...state.items!.map((e) => Text(e)).toList(),
                ]),
              ),
            ],
          );
        } else {
          return Text("empty");
        }
      case States.loading:
        return const Center(child: Text('Loading'));
    }
  }
}
