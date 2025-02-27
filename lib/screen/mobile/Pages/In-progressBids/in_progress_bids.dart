import 'package:flutter/material.dart';

class InProgressBids extends StatelessWidget {
  const InProgressBids({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10,8,8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
             
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: (){Navigator.pop(context);}, 
                      icon: Icon(Icons.arrow_back)
                      ),
                  ),
                ),
                const SizedBox(width: 60,),
                Container(
                  height: 40,
                  width: 180,
                   decoration: const BoxDecoration(color: Colors.blueAccent,),
                  
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text("In-Progress Bids:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                 
                ),
              ],
            ),
            const SizedBox(height: 30,),
        
            Table(
               border: TableBorder.symmetric(
            inside: BorderSide(width: 7, color: Colors.white),
          ),
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
              },
              children: [
                //header row
                TableRow(
                  decoration: BoxDecoration(color: Colors.blue),
                  children: [
                   Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Project Title",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
        
                    ),

                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Last Date of Submission",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
        
                    ),
                ]),

                //row 1
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Project name 1",style: TextStyle( color: Colors.black),)),
        
                    ),
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text(" 2024-01-01",style: TextStyle( color: Colors.black),)),
        
                    ),
                  ]
                ),

                //row 2
                 TableRow(
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 220, 214, 214)),
                  children: [
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Project name 1",style: TextStyle( color: Colors.black),)),
        
                    ),
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text(" 2024-01-01",style: TextStyle( color: Colors.black),)),
        
                    ),
                  ]
                ),

                 TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text("Project name 1",style: TextStyle( color: Colors.black),)),
        
                    ),
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text(" 2024-01-01",style: TextStyle( color: Colors.black),)),
        
                    ),
                  ]
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}