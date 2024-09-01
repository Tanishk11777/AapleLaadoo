import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:AapleLaadoo/constants.dart';

class FpScreenTopImage extends StatelessWidget {
  const FpScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black38), // Change color if needed
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Text("Forgot Password", style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black38), textAlign: TextAlign.center,),
            const Spacer(),
          ],
        ),
        //const SizedBox(height: 10),
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