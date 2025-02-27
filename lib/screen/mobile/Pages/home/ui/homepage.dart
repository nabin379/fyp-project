import 'package:cem/screen/mobile/Pages/home/ui/expiredbid_tab.dart';
import 'package:cem/screen/mobile/Pages/home/ui/hometab.dart';
import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
                 Image.asset("auctionicon.png",height: screenHeight * 0.07 ,),
                  SizedBox(width:screenWidth * 0.03,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("AVAS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                     Text("Academia Vendor Auction System",style: TextStyle(color: Colors.white,fontSize: screenHeight * 0.02),),
                   ],
                 ),
                 
              
            ],
          ),
          flexibleSpace: Container(

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.blue
                
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
          ),

          ),
          
          bottom: PreferredSize(
            preferredSize:  Size.fromHeight(screenHeight * 0.07),
            child: Container(
              color: Colors.white,
              child: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Home",),
                  Tab(text: "FAQs",),
                  Tab(text: "Expired bids",),
                  Tab(text: "Notices",),
                  Tab(text: "Events",)
                    
                    
              ]),
            ),
          ),
        ),
      
        body: const TabBarView(children: [
          Center(child: Hometab()),
          Center(child:   Text("FAQs"),),
          Center(child:   ExpiredbidTab()), 
          Center(child:   Text("Notices"),),
          Center(child:   Text("Events"),),
        ]),
        
      
        
      
      
                
             
      
      ),
    );
  }
}