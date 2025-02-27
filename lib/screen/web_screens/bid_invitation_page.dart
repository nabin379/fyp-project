import 'package:cem/screen/web_screens/bid_contents.dart';
import 'package:cem/screen/web_screens/items_lists.dart';
import 'package:cem/widgets/custom_elivated_button.dart';
import 'package:cem/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

class BidInvitationPage extends StatefulWidget {
  const BidInvitationPage({super.key});

  @override
  State<BidInvitationPage> createState() => _BidInvitationPageState();
}

class _BidInvitationPageState extends State<BidInvitationPage> {
  final List<TextEditingController> _bidinvitationcontroller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<Map<String, dynamic>> listOfItems = [];

  void _addToParagraph() {
    String bidName = _bidinvitationcontroller[0].text;
    String telephone = _bidinvitationcontroller[1].text;
    String facsmileNumber = _bidinvitationcontroller[2].text;
    String email = _bidinvitationcontroller[3].text;
    String bidFee = _bidinvitationcontroller[4].text;
    String bidSecurity = _bidinvitationcontroller[5].text;
    String nameOfBank = _bidinvitationcontroller[6].text;
    String accountNumber = _bidinvitationcontroller[7].text;
    String preBidMetting = _bidinvitationcontroller[8].text;
    String deadline = _bidinvitationcontroller[9].text;
    String openingDate = _bidinvitationcontroller[10].text;
    String validPeriod = _bidinvitationcontroller[11].text;

    // Format paragraph
    String paragraph = '''
  Invitation for Bids

Dudhpati, Bhaktapur

Bhaktapur Multiple Campus (BMC),

Date of publication: '$openingDate'

Invitation for Bids

 The Bhaktapur Multiple Campus (BMC) invites electronic bids from eligible bidders for the procurement of '$bidName' under National competitive bidding Single Stage Two Envelope procedures.

Under the Single Stage, Two Envelope Procedure, Bidders are required to submit simultaneously two separate sealed envelopes, one containing (i) the Technical Bid and the other (ii) the Price Bid, both in turn enclosed in one sealed envelope as per the provision of ITB 23 of the Bidding Document.

 Eligible Bidders may obtain further information and inspect the bidding documents at the office of Bhaktapur Multiple Campus (BMC) Dudhpati, Bhaktapur ,
Telephone:'$telephone' , Facsimile numbers:'$facsmileNumber' , Email address:'$email'.

Eligible bidders should deposit the cost of bidding document of a non-refundable fee of NRs '$bidFee' in Rajaswa (revenue) account as specified below and upload the scanned copy of deposit slip along with the Bidding Document.

Information to deposit the cost of bidding document in Bank:

 Name of the Bank:'$nameOfBank' , Thamel Branch Name of Office: Bhaktapur Multiple Campus (BMC),  Office Account no.: '$accountNumber'.


 Pre-bid meeting shall be held at Bhaktapur Multiple Campus (BMC), at '$preBidMetting' .

Electronic bids must be submitted through PPMO's e-GP system www.bolpatra.gov.np/egp on or before 12:00 Noon on '$deadline'. Bids received after this deadline will be rejected.

 The bids will be opened in the presence of Bidders' representatives who choose to attend at '$preBidMetting' at 13:00 PM at BMC, Dudhpati, Bhaktapur. Bids must be valid for a period of '$validPeriod' Until Days from the date of bid opening and must be accompanied by a scanned copy of the bid security in pdf format, amounting to as mentioned in the table below which shall be valid minimum 30 days beyond the bid validity period.

If the last date of purchasing and/or submission falls on a government holiday, then the next working day shall. be considered as the last date. In such case the validity period of the bid and bid security shall remain the same as
specified for the original last date of bid submission. The name and identification of the contracts are as follows:



Description of Work:'$bidName'

Cost of Bid Document NRs. : '$bidFee'

Bid Security Amount NRs. : '$bidSecurity'

Contract Period

1 (One) Year
  ''';

    //Add to paragraph

    setState(() {
      listOfItems.add({'paragraph': paragraph});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[0],
                        labelText: 'Bid Name',
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      "Address",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[1],
                        labelText: 'Telephone',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[2],
                        labelText: ' Facsmile ',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[3],
                        labelText: 'Email Address',
                      )),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                    child: Text(
                      "Date Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[8],
                        labelText: 'Pre Bid Meeting',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[9],
                        labelText: 'Bid Deadline',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[10],
                        labelText: 'Bid Openind Date',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[11],
                        labelText: 'Valid Until',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                    child: Text(
                      "Bank Details",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[4],
                        labelText: 'Bid Fee',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[5],
                        labelText: 'Bid Security',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[6],
                        labelText: 'Name Of Bank',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                      width: 220.0,
                      child: BidInvitationCustomTextFormField(
                        controller: _bidinvitationcontroller[7],
                        labelText: 'Account Number',
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addToParagraph,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 221, 110, 240),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                child: const Text(
                  'Add to Letter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Bid Invitation Letter")],
          ),
          Row(
            children: [
              //     ListView(
              //   children: [
              //     listOfItems.isNotEmpty
              //         ? Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Card(
              //               elevation: 4.0,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10.0),
              //                 child: Text(
              //                   listOfItems.last['paragraph'],
              //                   style: const TextStyle(fontSize: 14),
              //                 ),
              //               ),
              //             ),
              //           )
              //         : const Center(child: Text('No data available')),
              //   ],
              // )

              Expanded(
                child: listOfItems.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              listOfItems.last['paragraph'],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    : const Center(child: Text('No data available')),
              )
            ],
          )
        ],
      ),
      AppButton(
        onpressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (contex) => const ItemsListsPage()));
        },
      )
    ]));
  }
}
