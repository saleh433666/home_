import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/manger/layout_cubit.dart';
import 'home_categories_section.dart';
import 'home_products_section.dart';
import 'home_slider_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          body:  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                 padding:  EdgeInsets.all(20.0),
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Project Name:',style:
                     TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('                        "Home services"',style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold)

                      ),

                   ],
                 ),
               ),
                const SizedBox(height: 30,),
                HomeCategoriesSection(cubit:cubit),
                HomeProductsSection(cubit:cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}










