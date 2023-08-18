
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/shared_preferences.dart';
import '../../../../../core/widgets/component/d_material_button.dart';
import '../../../../../core/widgets/component/navigation.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../auth/features/view/login_screen.dart';
import '../../../../layout/manger/layout_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();
    return Center(
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          emailController.text = cubit.userModel!.email!;
          nameController.text = cubit.userModel!.name!;
          phoneController.text = cubit.userModel!.phone!;
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      label: 'Name',
                      prefix: Icons.person_3,
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      label: 'Phone Number',
                      prefix: Icons.phone_android_rounded,
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      buttonName: 'LogOut'.toUpperCase(),
                      onTap: () {
                        SharedPreference.removeData(key: 'uid').then((value) {
                          navigateAndFinish(context, const LoginScreen());
                          LayoutCubit.get(context).currentIndex = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
