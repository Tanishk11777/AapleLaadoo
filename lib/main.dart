import 'package:AapleLaadoo/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:AapleLaadoo/constants.dart';
import 'package:AapleLaadoo/responsive.dart';
import 'package:AapleLaadoo/start/startview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'HomePage/homePage.dart';
import 'Login/login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AapleLaadoo',
      theme: ThemeData(
          primaryColor: kPrimaryColour,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: kPrimaryColour,
                shape: const StadiumBorder(),
                minimumSize: const Size(double.infinity,56),
                maximumSize: const Size(double.infinity,56),
              )
          ),
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColour,
              prefixIconColor: kPrimaryColour,
              contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding),

              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              )
          )
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red));
            }
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const HomePage();
              } else {
                return const LoginScreen();  // Redirect to login if email is not verified
              }
            } else {
              return const StartPage();  // Redirect to login if no user is signed in
            }

          default:
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
        }
      },
    );
  }
}
