import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/component/d_material_button.dart';
import '../../../../../core/widgets/component/d_text_button.dart';
import '../../../../../core/widgets/component/d_text_form_field.dart';
import '../../../../../core/widgets/component/navigation.dart';
import '../../manger/auth_cubit.dart';
import '../register_screen.dart';

class LoginSec2 extends StatelessWidget {
  const LoginSec2({
    super.key,
    required this.emailController,
    required this.passController,
    required this.cubit,
    required this.formKey,
    required this.condition,
  });

  final TextEditingController emailController;
  final TextEditingController passController;
  final AuthCubit cubit;
  final GlobalKey<FormState> formKey;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DTextFormField(
          controller: passController,
          labelText: 'enter password',
          prefixIcon: Icons.lock_outline_sharp,
          suffixIcon: cubit.suffixIcon,
          keyboardType:TextInputType.emailAddress,
          obscureText: cubit.obscureText,
          suffixPressed: () {
            cubit.changePassVisibility();
          },
          validate: (value) {
            if (value.isEmpty) {
              return ('pass is too short');
            }
            return null;
          },
          onSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              cubit.userLogin(
                  email: emailController.text, password: passController.text);
            }
          },
        ),
        const SizedBox(
          height: 25,
        ),
        ConditionalBuilder(
          condition: !condition,
          builder: (context) => DMaterialButton(
              text: 'LOGIN',
              width: double.infinity,
              function: () {
                if (formKey.currentState!.validate()) {
                  cubit.userLogin(
                      email: emailController.text,
                      password: passController.text);
                }
              }),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            DTextButton(
                function: () {
                  navigateTo(context, const RegisterScreen());
                },
                text: 'register')
          ],
        )
      ],
    );
  }
}
