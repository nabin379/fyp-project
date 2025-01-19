import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cem"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 1.0],
              colors: [Colors.black, Color.fromARGB(255, 168, 22, 194)]),
        ),
        margin: const EdgeInsets.all(16.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                    child: IconButton(
                      iconSize: 24, // Reasonable size for an icon
                      onPressed: () {},
                      icon: const Icon(
                          Icons.access_alarm), // Replace with your desired icon
                      color: Colors.white, // Icon color
                    ),
                  )
                ],
              ),
              CategoryButton(
                text: "Wacth List",
                color: const Color.fromARGB(255, 215, 69, 238),
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
              CategoryButton(
                text: "Wacth List",
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final Color color;

  CategoryButton({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          fixedSize: const Size(12, 6),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ));
  }
}
