import 'package:flutter/material.dart';
import 'package:home_services/features/home/presentation/view/widgets/home_categories_list_view_item.dart';

import '../../../../layout/manger/layout_cubit.dart';


class HomeCategoriesSection extends StatelessWidget {
  const HomeCategoriesSection({
    super.key, required this.cubit,
  });
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Categories',
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: cubit.category.length,
              separatorBuilder: (context, index) =>
              const SizedBox(width: 15),
              itemBuilder: (context, index) =>
               CategoriesListViewItem(cubit: cubit,index:index),
            ),
          ),
          const SizedBox(height: 20),
          const Text('New Products',
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}