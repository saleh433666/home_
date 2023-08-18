import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manger/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);
//well done
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp,), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tab_outlined,), label: 'category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3,), label: 'setting'),
            ],
          ),
        );
      },
    );
  }
}
