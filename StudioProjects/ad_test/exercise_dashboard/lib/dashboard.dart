import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Speed: ",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              "3 km/h",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Time: ",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              "30 mins",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Calories: ",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              "100 kcal",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Save"),
        )
      ],
    );
  }
}
