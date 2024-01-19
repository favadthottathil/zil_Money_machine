import 'package:flutter/material.dart';
import 'package:zil_money/Components/custom_text_field.dart';
import 'package:zil_money/Controller/auth_controller.dart';
import 'package:zil_money/View/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: userNameController,
                hint: 'Email',
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: passwordController,
                hint: 'PassWord',
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const Text('Remember Me')
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthController()
                        .loginUser(
                      userNameController.text.trim(),
                      passwordController.text.trim(),
                    )
                        .then(
                      (value) {
                        if (value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductScreen(),
                            ),
                          );
                        } else {}
                      },
                    );
                  }
                },
                child: const Text('Sign In'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
