import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AapleLaadoo/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("LOGIN", style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black38), textAlign: TextAlign.center,),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Container(
              height: 300,
              width: 300,
              child: SvgPicture.asset("assets/icons/delivery.svg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 2)
      ],
    );
  }
}