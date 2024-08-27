import 'package:carwall/core/constant/icons.dart';
import 'package:carwall/core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CarsTopBar extends StatelessWidget {
  const CarsTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      height: size.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(4.0),
                child: CustomIcon(
                  MyIcons.MENU,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Erbil',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  child: CustomIcon(
                    MyIcons.LOCATION,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
