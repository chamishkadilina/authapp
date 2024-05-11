import 'package:authapp/components/my_button.dart';
import 'package:authapp/components/my_textfield.dart';
import 'package:authapp/components/squre_tile.dart';
import 'package:authapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({required this.onTap, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final conformPassword = TextEditingController();

  // register user
  void register() async {
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
      // pop the loading circle
      Navigator.pop(context);
      // check if password is confirmed
      if (password.text == conformPassword.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
      } else {
        Navigator.pop(context);
        // show error message, passwod did not matched
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Password Mismatch'),
              content: const Text(
                  'The passwords you entered do not match. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;

        default:
          errorMessage = 'an error occured please try again later';
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
              children: [
                const SizedBox(height: 24),

                // logo
                const Icon(
                  Icons.lock,
                  size: 120,
                ),
                const SizedBox(height: 24),

                // Let s create an account for you!
                Text(
                  'Let\'s create an account for you!',
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
                // conform password textField
                MyTextfield(
                  controller: conformPassword,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                // sign in button
                MyButton(
                  text: 'Register',
                  onTap: register,
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
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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
