import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/items_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var i = context.watch<ItemsCubit>().state.items!.length;
    return Scaffold(
        appBar: AppBar(title: Text("Cart")),
        body: Center(child: Text(i.toString())));
  }
}
