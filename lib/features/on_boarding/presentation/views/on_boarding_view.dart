import 'package:flutter/material.dart';
import 'package:home_services/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';

import '../../../../core/widgets/component/navigation.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../auth/features/view/login_screen.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions:  [
          CustomTextButton(
            onPressed:() =>  navigateAndFinish(context, const LoginScreen()),
            text: 'Skip',
          ),
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}




