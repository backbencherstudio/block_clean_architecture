import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/view/login/widget/email_input_widget.dart';
import 'package:flutter_block/view/login/widget/password_input_widget.dart';
import 'package:flutter_block/view/login/widget/submit_button_widget.dart';
import 'package:go_router/go_router.dart';

import '../../block/auth_bloc/auth_bloc.dart';
import '../../block/auth_bloc/auth_events.dart';
import '../../block/auth_bloc/auth_states.dart';
import '../../routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              context.go(RoutesName.productList);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputWidget(controller: emailController),
              const SizedBox(height: 16),
              PasswordInputWidget(controller: passwordController),
              const SizedBox(height: 24),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return SubmitButtonWidget(
                    isLoading: state is AuthLoading,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                        ),
                      );
                    },
                    label: 'Login',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
