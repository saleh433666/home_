import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../layout/manger/layout_cubit.dart';

class HomeSliderSection extends StatelessWidget {
  const HomeSliderSection({
    super.key, required this.cubit,
  });
final LayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Image.asset('assets/images/card_1.png'),
        Image.asset('assets/images/card_1.png'),
        Image.asset('assets/images/card_1.png'),
      ],
      options: CarouselOptions(
        height: 250.0,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}