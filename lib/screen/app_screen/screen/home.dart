import 'package:cem/screen/mobile/Pages/home/ui/homepage.dart';
import 'package:cem/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          Center(
            child: Text(
              "Welcome to Academia Vendor Auction System",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ElevatedButton(onPressed: (){
             Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Homepage()),
                  );
          }, 
          child: Text("Continue"))
        ],
      ),
    );
  }
}


