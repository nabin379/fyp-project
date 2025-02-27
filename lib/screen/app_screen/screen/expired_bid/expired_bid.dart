import 'package:flutter/material.dart';

class ExpiredbidTab extends StatefulWidget {
  const ExpiredbidTab({super.key});

  @override
  State<ExpiredbidTab> createState() => _ExpiredbidTabState();
}

class _ExpiredbidTabState extends State<ExpiredbidTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
            child: ListTile(
              title: Text('Bid one',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold, color: Colors.black),),
              subtitle: Row(
                children: [
                  Text('Issued date: 01-01-2023',style: TextStyle(fontSize: 13, color: Colors.green),),
                  SizedBox(width: 30,),
                  Text('Expiry date: 01-01-2023',style: TextStyle(fontSize: 13, color: Colors.red),),

                ],
              ),
            ),
          );
        });
  }
}