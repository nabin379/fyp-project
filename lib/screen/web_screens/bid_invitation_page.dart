import 'package:cem/core/constants/app_colors.dart';
import 'package:cem/core/utils/validation.dart';
import 'package:cem/features/bid/models/bid_invitation.dart';
import 'package:cem/features/bid/providers/date_provider.dart';
import 'package:cem/features/bid/providers/publish_bid_provider.dart';
import 'package:cem/features/bid/repository/bid_repository.dart';
import 'package:cem/screen/web_screens/items_lists.dart';
import 'package:cem/widgets/custom_elivated_button.dart';
import 'package:cem/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class PublishBidPage extends StatefulWidget {
  const PublishBidPage({super.key});

  @override
  State<PublishBidPage> createState() => _PublishBidPageState();
}

class _PublishBidPageState extends State<PublishBidPage> {
  // Separate controllers for better readability and maintainability
  final TextEditingController _bidNameController = TextEditingController();
  final TextEditingController _nameOfBankController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _openingDateController = TextEditingController();
  final TextEditingController _validPeriodController = TextEditingController();

  String _paragraph = "";

  void _addToParagraph() {
    // first check validation
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      _showValidationToast();
      return;
    }

    String bidName = _bidNameController.text;
    String nameOfBank = _nameOfBankController.text;
    String accountNumber = _accountNumberController.text;

    String openingDate = _openingDateController.text;
    String validPeriod = _validPeriodController.text;

    // Format paragraph
    String paragraph = '''
  Invitation for Bids

Dudhpati, Bhaktapur

Bhaktapur Multiple Campus (BMC),

Date of publication: '$openingDate'

Invitation for Bids

 The Bhaktapur Multiple Campus (BMC) invites electronic bids from eligible bidders for the procurement of '$bidName' under National competitive bidding Single Stage Two Envelope procedures.

Under the Single Stage, Two Envelope Procedure, Bidders are required to submit simultaneously two separate sealed envelopes, one containing (i) the Technical Bid and the other (ii) the Price Bid, both in turn enclosed in one sealed envelope as per the provision of ITB 23 of the Bidding Document.

 Eligible Bidders may obtain further information and inspect the bidding documents at the office of Bhaktapur Multiple Campus (BMC) Dudhpati, Bhaktapur,.

Eligible bidders should deposit the cost of bidding document of a non-refundable fee of NRs 1000 in Rajaswa (revenue) account as specified below and upload the scanned copy of deposit slip along with the Bidding Document.

Information to deposit the cost of bidding document in Bank:

 Name of the Bank: '$nameOfBank', Thamel Branch Name of Office: Bhaktapur Multiple Campus (BMC),  Office Account no.: '$accountNumber'.

 Pre-bid meeting shall be held at Bhaktapur Multiple Campus (BMC).

Electronic bids must be submitted through PPMO's e-GP system www.bolpatra.gov.np/egp on or before 12:00 Noon . Bids received after this deadline will be rejected.

 The bids will be opened in the presence of Bidders' representatives who choose to attend  at 13:00 PM at BMC, Dudhpati, Bhaktapur. Bids must be valid for a period of '$validPeriod' Until Days from the date of bid opening and must be accompanied by a scanned copy of the bid security in pdf format, amounting to as mentioned in the table below which shall be valid minimum 30 days beyond the bid validity period.

If the last date of purchasing and/or submission falls on a government holiday, then the next working day shall be considered as the last date. In such case, the validity period of the bid and bid security shall remain the same as specified for the original last date of bid submission.

Description of Work: '$bidName'

Contract Period

1 (One) Year
  ''';

    // Add to paragraph list
    setState(() {
      _paragraph = paragraph;
    });
  }

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  DateTime? _validDateTime;
  DateTime? _openingDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Publish Bid",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(children: [
              Column(
                // spacing: 20.0,
                children: [
                  const SizedBox(
                    height: 30,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  BidInvitationCustomTextFormField(
                    controller: _bidNameController,
                    labelText: 'Bid Name',
                    validator: (val) {
                      return Validation.validateEmpty(
                          val, "Please enter name of the bid");
                    },
                  ),
                  const Text(
                    "Date Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // bid opening date
                  ChangeNotifierProvider(
                    create: (context) => DateProvider(),
                    child: Consumer<DateProvider>(
                      builder: (context, dateProvider, _) {
                        // change the value of text controller
                        _openingDateController.text =
                            dateProvider.pickedDate?.toIso8601String() ?? "";

                        // initialize opening date
                        _openingDateTime = dateProvider.pickedDate;

                        return BidInvitationCustomTextFormField(
                          controller: _openingDateController,
                          labelText: 'Bid Opening Date',
                          readOnly: true,
                          onTap: () {
                            dateProvider.pickDate(context);
                          },
                          validator: (val) {
                            return Validation.validateEmpty(
                                val, "Please select opening date of the bid");
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  // valid until
                  ChangeNotifierProvider(
                    create: (context) => DateProvider(),
                    child: Consumer<DateProvider>(
                      builder: (context, dateProvider, _) {
                        // change the value of text controller
                        _validPeriodController.text =
                            dateProvider.pickedDate?.toIso8601String() ?? "";

                        // initialize end date
                        _validDateTime = dateProvider.pickedDate;

                        return BidInvitationCustomTextFormField(
                          controller: _validPeriodController,
                          labelText: 'Valid Until',
                          readOnly: true,
                          onTap: () {
                            dateProvider.pickDate(context);
                          },
                          validator: (val) {
                            return Validation.validateEmpty(
                                val, "Please select valid date of the bid");
                          },
                        );
                      },
                    ),
                  ),
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
                  BidInvitationCustomTextFormField(
                    controller: _nameOfBankController,
                    labelText: 'Name Of Bank',
                    validator: (val) {
                      return Validation.validateEmpty(
                          val, "Please enter name of the bank");
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  BidInvitationCustomTextFormField(
                    controller: _accountNumberController,
                    keyboardType: TextInputType.number,
                    labelText: 'Account Number',
                    validator: (val) {
                      return Validation.validateEmpty(
                          val, "Please enter account number of the bank");
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _addToParagraph,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 221, 110, 240),
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
              if (_paragraph.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _paragraph,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              AppButton(
                onpressed: () {
                  final isValid = _formKey.currentState?.validate() ?? false;

                  if (!isValid) {
                    _showValidationToast();
                    return;
                  }

                  // create bid model class
                  final bid = Bid(
                    title: _bidNameController.text,
                    bankAccNo: int.tryParse(_accountNumberController.text),
                    bankName: _nameOfBankController.text,
                    validDate: _openingDateTime,
                    closeDate: _validDateTime,
                  );

                  // else navigate to next page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => ChangeNotifierProvider(
                                create: (_) => PublishBidProvider(
                                  context.read<BidRepository>(),
                                ),
                                child: ItemsListsPage(
                                  bid: bid,
                                ),
                              )));
                },
              )
            ]),
          ),
        ));
  }

  void _showValidationToast() {
    Fluttertoast.showToast(
        msg: "Please complete the form", webPosition: "center");
  }
}
