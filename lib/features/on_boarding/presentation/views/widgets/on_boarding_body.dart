import 'package:flutter/material.dart';
import 'package:home_services/features/on_boarding/presentation/views/widgets/page_view_section.dart';
import 'package:home_services/features/on_boarding/presentation/views/widgets/smooth_page_indicator_section.dart';

import '../../../data/models/on_boarding_model.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  bool isLast = false;
  PageController? pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          PageViewSection(
            pageController: pageController,
            onPageChanged: (value) {
              if (value == OnBoardingModel.boarding.length - 1) {
                setState(
                  () {
                    isLast = true;
                  },
                );
              } else {
                setState(
                  () {
                    isLast = false;
                  },
                );
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          SmoothPageIndicatorSection(
            pageController: pageController!,
            isLast: isLast,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
