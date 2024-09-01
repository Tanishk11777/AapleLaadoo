import 'package:AapleLaadoo/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

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
        title: const Text('Alert'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _resetPassword() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      _showSuccessDialog("We have sent you a password reset link to your email");
    } on FirebaseAuthException catch (e) {
      String errorMessage=e.code.toString();
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
          const SizedBox(height: defaultPadding),
          _isLoading
              ? const CircularProgressIndicator()
              : Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _resetPassword();
                }
              },
              child: Text(
                "Submit".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          RememberCheck(
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
class RememberCheck extends StatelessWidget {
  final Function? press;
  const RememberCheck({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Back to login ? ",
          style: TextStyle(color: kPrimaryColour),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: const Text(
            "Tap hare",
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