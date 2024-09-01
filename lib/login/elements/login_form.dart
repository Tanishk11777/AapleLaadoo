import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:AapleLaadoo/signup/signup_screen.dart';
import 'package:AapleLaadoo/components/registredcheck.dart';
import '../../../constants.dart';
import '../../ForgotPassword/FP_screen.dart';
import '../../HomePage/homePage.dart';
import '../../start/startview.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK'),
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

  void _signInWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        _showSuccessDialog('A verification email has been sent. Please check your email.');
      } else if (userCredential.user != null && userCredential.user!.emailVerified) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password';
      } else {
        errorMessage = e.code.toString();
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
      key: _formkey,
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
                return "Please enter your email";
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
                  return "Please enter your password";
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
          const SizedBox(height: defaultPadding),
          _isLoading
              ? const CircularProgressIndicator()
              : Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _signInWithEmailAndPassword();
                }
              },
              child: Text(
                "Login".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          RegisteredCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 7),
          ForgotPassword(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasswordScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  final void Function()? press;
  const ForgotPassword({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Forgot Your Password? ",
          style: TextStyle(color: kPrimaryColour),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "Tap here",
            style: TextStyle(
              color: kPrimaryColour,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
