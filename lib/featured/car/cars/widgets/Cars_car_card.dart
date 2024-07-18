import 'package:flutter/material.dart';

class CarsCarCard extends StatelessWidget {
  const CarsCarCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (i, context) {
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            // color: Colors.black12,
          ),
          // height: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.2,
                    // color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        'assets/images/car.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(4),
                    // color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          // width: 80,
                          // height: 25,
                          child: Text(
                            'Best Offer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                // color: Colors.white30,
                margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Audi A8',
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text('4.5'),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  height: 4,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Manual',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '\$80,000',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
