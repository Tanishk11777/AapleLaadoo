import 'package:AapleLaadoo/components/background.dart';
import 'package:AapleLaadoo/responsive.dart';
import 'package:flutter/material.dart';
import 'package:AapleLaadoo/start/elements/loginImage.dart';
import 'package:AapleLaadoo/start/elements/loginBtn.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
              desktop: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: StartImage(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 450,
                          child: LoginSignupBtn(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            mobile: MobileWelcomeScreen(),
          ),
        ),
    ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StartImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
