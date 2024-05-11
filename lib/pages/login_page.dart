import 'package:authapp/components/my_button.dart';
import 'package:authapp/components/my_textfield.dart';
import 'package:authapp/components/squre_tile.dart';
import 'package:authapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({required this.onTap, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final email = TextEditingController();
  final password = TextEditingController();

  // log user in
  void logIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage =
              'The email address you entered is not associated with an account.';
          break;
        case 'wrong-password':
          errorMessage = 'The password you entered is incorrect.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address you entered is invalid.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many login attempts. Please try again later.';
          break;
        default:
          errorMessage =
              'The email or password you entered did not match our records. Please double-check and try again.';
      }

      //wrong email or password message popup
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // logo
                const Icon(
                  Icons.lock,
                  size: 120,
                ),
                const SizedBox(height: 24),

                // welcome back you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 20),

                // username textField
                MyTextfield(
                  controller: email,
                  hintText: 'Email Adress',
                  obscureText: false,
                ),
                const SizedBox(height: 8),

                // password textField
                MyTextfield(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 8),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // sign up button
                MyButton(
                  text: 'Log in',
                  onTap: logIn,
                ),
                const SizedBox(height: 48),

                // or Continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Colors.grey),
                      ),
                      Text(
                        ' Or Continue With ',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const Expanded(
                        child: Divider(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // google + apple sing in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SuqreTile(
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                      imagePath: 'assets/images/google.png',
                    ),

                    const SizedBox(width: 20),

                    // apple button
                    SuqreTile(
                      onTap: () {},
                      imagePath: 'assets/images/apple.png',
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
