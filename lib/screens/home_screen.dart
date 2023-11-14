// Copyright 2023 eduhoratiu <https://eduhoratiu.com/>
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// import '../common/strings.dart' as strings;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double avalibleScreenWith = 0;

  @override
  Widget build(BuildContext context) {
    avalibleScreenWith = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          alignment: Alignment.bottomCenter,
          height: 170,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 193, 35, 35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dash Board",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "All the things you need to know",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(.1),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(.1),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],)
            ],),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                    text: "Spendings this month",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: " \$2360.00",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ]),
              ),
              const Text(
                " (Avg \$188.00)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              buildChart("Bills", Colors.blue, .22),
              buildChart("Food", Colors.purple, .19),
              buildChart("Car", Colors.yellow, .26),
              buildChart("Other", const Color.fromARGB(255, 193, 35, 35), .23),
              buildChart("Savings", Colors.green, .1),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          height: 20,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  buildExpensesCards(Icons.bakery_dining, "Bakery", "20.00"),
                  const SizedBox(
                    width: 25,
                  ),
                  buildExpensesCards(
                      Icons.car_crash_outlined, "Car repairs", "350.00"),
                  const SizedBox(
                    width: 25,
                  ),
                  buildExpensesCards(
                      Icons.camera_alt_outlined, "New camera", "800.00"),
                  const SizedBox(
                    width: 25,
                  ),
                  buildExpensesCards(
                      Icons.call, "Phone bill", "40.00"),
                ],
              )],
          ),
        )
      ]),
    );
  }

  Column buildExpensesCards(IconData icon, String title, String price) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(.1),
          ),
          padding: const EdgeInsets.all(20),
          height: 110,
          child: Icon(
            icon,
            size: 75.0,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
            text: TextSpan(
          text: title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: "\n\$$price",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),],
        )),
      ],);
  }

  Column buildChart(String title, Color color, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: avalibleScreenWith * width,
          height: 4,
          color: color,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],);
  }
}
