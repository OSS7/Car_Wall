import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import 'cubit/signup_cubit.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignupCubit, SignupState>(
        bloc: signupCubit,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  hintText: 'Email',
                  control: _emailController,
                ),
                CustomTextField(
                  hintText: 'Password',
                  control: _passwordController,
                  // obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  foregroundColor: cWhite,
                  backgroundColor: cPrimary,
                  onPress: () {
                    signupCubit.signup(
                        _emailController.text, _passwordController.text);
                  },
                  title: 'Sign up',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
