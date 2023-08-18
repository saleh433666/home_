

import 'package:flutter/material.dart';

import '../../../../layout/manger/layout_cubit.dart';
import 'home_products_grid_view_item.dart';

class HomeProductsSection extends StatelessWidget {
  const HomeProductsSection({
    super.key, required this.cubit,
  });
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: 2,
        ),
        itemCount: cubit.product.length,
        itemBuilder: (context, index) =>  HomeProductsGridViewItem(cubit: cubit,index:index),
      ),
      // child: GridView.count(
      //   shrinkWrap: true,
      //   physics: const NeverScrollableScrollPhysics(),
      //   crossAxisCount: 2,
      //   mainAxisSpacing: 1,
      //   childAspectRatio: 1 / 1.6,
      //   crossAxisSpacing: 1,
      //   children: List.generate(
      //     10,
      //         (index) {
      //       return const ProductsCategoryGridView();
      //     },
      //   ),
      // ),
    );
  }
}