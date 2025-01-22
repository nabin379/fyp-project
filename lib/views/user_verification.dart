import 'dart:convert';

import 'package:cem/model/verified_users.dart';
import 'package:flutter/material.dart';

class UserVerification extends StatelessWidget {
  const UserVerification({super.key});

  @override
  Widget build(BuildContext context) {
    String jsonData = '''
    [
      {
        "id": "1",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "2",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "3",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "4",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "5",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "6",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "7",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "8",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "9",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "10",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "11",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "12",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      },
      {
        "id": "13",
        "name": "John Doe",
        "dob": "1990-01-01",
        "panBill": "PAN12345",
        "vatBill": "VAT67890",
        "citizenshipNumber": "CIT1234567",
        "officeName": "Tech Solutions",
        "phoneNumber": "+1234567890",
        "email": "johndoe@example.com"
      },
      {
        "id": "14",
        "name": "Jane Smith",
        "dob": "1985-02-15",
        "panBill": "PAN54321",
        "vatBill": "VAT98765",
        "citizenshipNumber": "CIT7654321",
        "officeName": "Creative Agency",
        "phoneNumber": "+0987654321",
        "email": "janesmith@example.com"
      }
    ]
    ''';
    List<dynamic> userListJson = jsonDecode(jsonData);
    List<User> userList =
        userListJson.map((json) => User.fromJson(json)).toList();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: const Text("User Verification"),
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: double.infinity,
              width: screenWidth * 0.4,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[300],
                           shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Adjust the radius here
    ),
                          ),
                          
                          
                      child: Text(
                        "Verified Users",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      )),
                  SizedBox(height: 30,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color:
                                    Colors.green[700], // Light gray background
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Center(child: Icon(Icons.person)),
                                ),
                                title: Text("User Id: ${user.id}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
                                subtitle: Text(user.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                                trailing: TextButton(
                                    onPressed: () {
                                      _showUserDetailsDialog(context, user);
                                    },
                                    child: Text("View more",style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: screenWidth * 0.4,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[300],
                           shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Adjust the radius here
    ),),
                      child: Text("Unverified Users",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                          )
                          ),
                  SizedBox(height: 30,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: Colors.red[700], // Light gray background
                                borderRadius:
                                    BorderRadius.circular(20), // Rounded corners
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Center(child: Icon(Icons.person)),
                                ),
                                title: Text("User Id: ${user.id}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
                                subtitle: Text(user.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                                trailing: TextButton(
                                    onPressed: () {
                                      _showUserDetailsDialog(context, user);
                                    },
                                    child: Text("View more",style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showUserDetailsDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("User Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${user.id}"),
              Text("Name: ${user.name}"),
              Text("DOB: ${user.dob}"),
              Text("PAN Bill: ${user.panBill}"),
              Text("VAT Bill: ${user.vatBill}"),
              Text("Citizenship Number: ${user.citizenshipNumber}"),
              Text("Office Name: ${user.officeName}"),
              Text("Phone Number: ${user.phoneNumber}"),
              Text("Email: ${user.email}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
