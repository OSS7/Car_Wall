import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class OnBoardingTopText extends StatelessWidget {
  const OnBoardingTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.car_crash_sharp,color: Colors.white,),
              const SizedBox(width: 10,),
              Text(
                'CarWall',
                style: TextStyle(
                  color: cWhite,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 25,),
          Text(
            'Let\'s get started',
            style: TextStyle(
              color: cWhite,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Continue to the app to see what is \n happening near you',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
