
import 'package:cem/screen/web_screens/user_verification.dart';
import 'package:flutter/material.dart';


class AdminManagement extends StatelessWidget {
  const AdminManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: const Text("Admin Management"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Home"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("About"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Services"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Contract"),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/handshake_procure.jpg",
                fit: BoxFit.cover,
              )),
          Positioned(
            bottom: 50,
            left: 400,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => UserVerification()),
);

                  }, 
                  style: ElevatedButton.styleFrom(
                    
                    elevation: 10,
                    backgroundColor: Colors.deepOrange[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
                  ),
                  child: Text("USER VERIFICATION",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
          Positioned(
            bottom: 50,
            left: 700,
              child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    
                    elevation: 10,
                    backgroundColor: Colors.deepOrange[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
                  ),
                  child: Text("CHANGE PASSWORD",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),

           Positioned(
            bottom: 50,
            left: 1000,
              child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    
                    elevation: 10,
                    backgroundColor:Colors.deepOrange[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(30),
                    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
                  ),
                  child: Text("OTHER SERVICES",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
        ],
      ),
    );
  }
}
