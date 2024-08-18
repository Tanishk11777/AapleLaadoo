import 'package:AapleLaadoo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartImage extends StatelessWidget {
  const StartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome to AapleLaadoo",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: defaultPadding*2),
        Row(
          children: [
            Spacer(),
            Container(
              width: 350,
              height: 350,
              child: Image.asset("assets/logo.png"),
            ),
            Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding*2),
      ],
    );
  }
}
