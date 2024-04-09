import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../customWidgets.dart';
import '../styles/colors.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> transactions = [];
  TextEditingController amountController = TextEditingController();
  String? selectedHead;

  @override
  Widget build(BuildContext context) {

    int totalPrice = 0;
    for (var itemData in transactions) {
      int price = int.tryParse(itemData['amount']) ?? 0;
      totalPrice += price;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
        title: const Text("Collections", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 3),
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Transaction Id", style: TextStyle(fontSize: 13.0,
                    fontWeight: FontWeight.bold, fontFamily: appFontFamily,)),
                  Text("Head", style: TextStyle(fontSize: 13.0,
                    fontWeight: FontWeight.bold, fontFamily: appFontFamily,)),
                  Text("Amount", style: TextStyle(fontSize: 13.0,
                      fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
                  Text("SMS", style: TextStyle(fontSize: 13.0,
                      fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
                  Text("Whatsapp", style: TextStyle(fontSize: 13.0,
                      fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var itemData = transactions[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: index.isEven ? const Color(0xFFFFA456) : const Color(0xF327FEEB),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        itemData['transactionId'],
                        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),
                      ),
                      Text(
                        itemData['head'],
                        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),
                      ),
                      Text(
                        itemData['amount'],
                        style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),
                      ),
                      IconButton(
                        onPressed: () {
                          _sendingSMS(itemData['transactionId'], itemData['head'], itemData['amount'], itemData['date']);
                        },
                        icon: const Icon(Icons.sms, color: Colors.white,),
                      ),
                      IconButton(
                        onPressed: () {
                          _openWhatsApp(itemData['transactionId'], itemData['head'], itemData['amount'], itemData['date']);
                        },
                        icon: const Icon(Icons.phone_android_sharp, color: Colors.white,),
                      )
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        onPressed: (){
          addCollection();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Total: ${totalPrice.toString()}",
                style: const TextStyle(fontSize: 20.0,
                    fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
          ],
        ),
      ),
    );
  }

  Future<void> addCollection()async{
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Add Payment',
            style: TextStyle(fontFamily: appFontFamily),)),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 15.0,),
                  CustomDropdownButtonFormField(
                    value: selectedHead,
                    hintText: "Select Head",
                    labelText: "Head",
                    prefixIcon: Icon(Icons.person_3, color: iconColor,),
                    onChanged: (value) {
                      print('Selected Head: $value');
                      setState(() {
                        selectedHead = value;
                      });
                    },
                    items: <String>[
                      "Sadqa",
                      "Zakat",
                      "Fitrana",
                      "Khumas",
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        alignment: AlignmentDirectional.center,
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Choose an Option';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0,),
                  CustomTextFormField(
                    hintText: "Amount",
                    labelText: "Amount",
                    validator: (value){
                      if(value.isEmpty){
                        return "Please Enter a Value";
                      }
                      return null;
                    },
                    prefixIcon: Icon(Icons.payments, color: iconColor,),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  setState(() {
                    String transactionId = DateTime.now().millisecondsSinceEpoch.toString();
                    transactions.add({
                      "head" : selectedHead,
                      "amount" : amountController.text,
                      "transactionId" : transactionId,
                      'date' : DateTime.now(),
                    });
                  });
                  amountController.clear();
                  selectedHead = null;
                  Navigator.pop(context);
                }
              },
              child: const Text('Add', style: TextStyle(fontFamily: appFontFamily),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel', style: TextStyle(fontFamily: appFontFamily),),
            ),
          ],
        );
      },
    );
  }

  void _sendingSMS(String transactionId, String head, String amount, DateTime dateTime) async {
    String formattedDateTime = _formatDateTime(dateTime);
    String message = "Date: $formattedDateTime\nTransactionID: $transactionId\nHead: $head\nAmount: $amount";
    String url = "sms:+923008497241?body=$message";
    await _launchURL(url);
  }

  void _openWhatsApp(String transactionId, String head, String amount, DateTime dateTime) async {
    String formattedDateTime = _formatDateTime(dateTime);
    String message = "Date: $formattedDateTime\nTransactionID: $transactionId\nHead: $head\nAmount: $amount";
    String url = "https://wa.me/923008497241?text=${Uri.parse(message)}";
    await _launchURL(url);
  }

  String _formatDateTime(DateTime dateTime) {
    String day = _addLeadingZero(dateTime.day);
    String month = _addLeadingZero(dateTime.month);
    String year = dateTime.year.toString();
    String hour = _addLeadingZero(dateTime.hour);
    String minute = _addLeadingZero(dateTime.minute);
    String second = _addLeadingZero(dateTime.second);

    return '$day/$month/$year $hour:$minute:$second';
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }




  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
