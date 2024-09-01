import 'package:flutter/material.dart';
import 'package:AapleLaadoo/components/background.dart';
import 'package:AapleLaadoo/responsive.dart';

import 'elements/forgot_form.dart';
import 'elements/FP_screen_top_image.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobilePasswordScreen(),
            desktop: Row(
              children: [
                Expanded(
                  child: FpScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: ForgotForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobilePasswordScreen extends StatelessWidget {
  const MobilePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgotForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
