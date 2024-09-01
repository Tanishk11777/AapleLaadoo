import 'package:AapleLaadoo/start/startview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:AapleLaadoo/components/registredcheck.dart';
import '../../../constants.dart';
import '../../HomePage/HomePage.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartPage(),
                ),
              );
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  void _signUpWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        _showSuccessDialog('A verification email has been sent. Please check your email.');
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(),
      //   ),
      // );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage='weak password';
      } else if (e.code == 'email-already-in-use') {
        errorMessage='The account already exists for that email.';
      }else{
        errorMessage=e.code.toString();
      }
      _showErrorDialog(errorMessage);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColour,
            onSaved: (email) {},
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Email Address';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: !_isPasswordVisible,
              cursorColor: kPrimaryColour,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black38,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          _isLoading
              ? const CircularProgressIndicator()
              : Hero(
            tag: "signup_btn",
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _signUpWithEmailAndPassword();
                }
              },
              child: Text("Sign Up".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                  )
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          RegisteredCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
