import 'package:flutter/material.dart';

import 'widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CategoriesViewBody(),
    );
  }
}
