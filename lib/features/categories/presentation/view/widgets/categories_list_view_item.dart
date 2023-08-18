import 'package:flutter/material.dart';

import '../../../../layout/manger/layout_cubit.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem(
      {Key? key, required this.index, required this.cubit})
      : super(key: key);
  final int index;
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Image.network(
            cubit.category[index].image!,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          Text(
            cubit.category[index].name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),

    );
  }
}