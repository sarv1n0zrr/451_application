import 'package:book_app/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:book_app/components.dart/my_button.dart';
import 'package:book_app/components.dart/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    // if password match -> create a user
    if (_passwordController.text == _confirmPwController.text) {
      try {
        _auth.signInWithEmailAndPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
    // don't match -> tell user to fix a mistake
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text(
            "Passwords don't match!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.message,
            size: 60,
            color: Colors.white,
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Let's create an account for you!",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyTextField(
            hintText: 'Email',
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Password',
            obscureText: true,
            controller: _passwordController,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Confirm password',
            obscureText: true,
            controller: _confirmPwController,
          ),
          const SizedBox(
            height: 25,
          ),
          MyButton(
            text: 'Register',
            onTap: () => register(context),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'Login now!',
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
