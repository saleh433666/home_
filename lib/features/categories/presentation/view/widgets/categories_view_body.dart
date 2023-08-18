import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/manger/layout_cubit.dart';
import 'categories_list_view_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                CategoriesListViewItem(cubit: cubit, index: index),
            separatorBuilder: (context, index) =>const Divider(thickness: 1),
            itemCount: cubit.category.length);
      //
      },
    );
  }

}