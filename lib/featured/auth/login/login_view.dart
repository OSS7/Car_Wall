import 'package:carwall/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import 'cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        bloc: loginCubit,
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  control: _emailController,
                  hintText: 'Email',
                ),
                CustomTextField(
                  control: _passwordController,
                  hintText: 'Password',
                  // obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  foregroundColor: cWhite,
                  backgroundColor: cPrimary,
                  onPress: () {
                    loginCubit.loginWithFirebase(
                        _emailController.text, _passwordController.text);
                    // Get.toNamed(MyRoutes.CARS);
                  },
                  title: 'Login',
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(MyRoutes.SIGNUP);
                  },
                  child: const Text(
                    'Already have an account?\n sign up',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
