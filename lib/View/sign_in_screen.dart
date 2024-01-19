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

  bool isChecked = false;

  checkRemembered() async {
    if (await AuthController().getUserData() != null && await AuthController().getUserData() == true) {
      String userName = await AuthController().getUserName();

      String userPass = await AuthController().getUserPass();

      setState(() {
        userNameController.text = userName;

        passwordController.text = userPass;
      });
    }
  }

  @override
  void initState() {
    checkRemembered();
    super.initState();
  }

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
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  const Text('Remember Me')
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (isChecked) {
                      AuthController().storeUserData(true).then((_) async {
                        await AuthController().storeUserName(
                          userNameController.text.trim(),
                        );
                        await AuthController().storeUserpassWord(
                          passwordController.text.trim(),
                        );
                      });
                    } else {
                      await AuthController().storeUserData(false);
                    }

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
