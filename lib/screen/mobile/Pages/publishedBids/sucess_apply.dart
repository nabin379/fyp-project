import 'package:cem/screen/mobile/Pages/home/ui/homepage.dart';
import 'package:flutter/material.dart';

class SuccessApply extends StatefulWidget {
  const SuccessApply({super.key});

  @override
  State<SuccessApply> createState() => _SuccessApplyState();
}

class _SuccessApplyState extends State<SuccessApply> {
    

  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  final screenWidth = screenSize.width;
  final screenHeight = screenSize.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
           children: [
              SizedBox(
               height: screenHeight*0.05
             ),
             Text('Apply Success ',style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 83, 82, 82)),),
             SizedBox(height: screenHeight*0.15),
             Container(
               height: 150,
               width: 150,
               decoration: BoxDecoration(
               // color: Colors.red,
          
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image:AssetImage("assets/images/checkmarkgreen.png",))
               ),
               ),   //ERROR
              SizedBox(height: screenHeight*0.1,),
             Text("Successfully Applied",style: TextStyle(fontSize:23,fontWeight: FontWeight.bold ),),
             
              SizedBox(height: screenHeight*0.2,),
             
            
           ],
          ),
           ElevatedButton(
                   onPressed: (){
                   Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => const Homepage()),
  (route) => false, // Removes all previous routes
);
                   }, 
                  
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.grey[600],
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10)
                     )
                   ),
                    child: Container(
                     
                     width: double.maxFinite,
                     child: const Center(child: Text('Back to home' , style: TextStyle(color: Colors.white),))),
                   ),
           
        ],
      ),
    );
  }
}