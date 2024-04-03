import 'package:flutter/material.dart';
import '../../customWidgets.dart';
import '../../styles/colors.dart';
import 'pay.dart';

class SelectPayment extends StatefulWidget {
  final int? amount;
  const SelectPayment({super.key, this.amount});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {

  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Option", style: TextStyle(fontFamily: appFontFamily),),
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Center(
              child: Text("You have to Pay: ${widget.amount}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: appFontFamily),),
            ),
            const SizedBox(height: 20.0,),
            RadioListTile(
                title: const Text("Bank Account", style: TextStyle(fontFamily: appFontFamily),),
                value: "Bank",
                groupValue: selectedMethod,
                onChanged: (value){
                  setState(() {
                    selectedMethod = value;
                  });
                }),
            RadioListTile(
                title: const Text("JazzCash", style: TextStyle(fontFamily: appFontFamily),),
                value: "JazzCash",
                groupValue: selectedMethod,
                onChanged: (value){
                  setState(() {
                    selectedMethod = value;
                  });
                }),
            RadioListTile(
                title: const Text("EasyPaisa", style: TextStyle(fontFamily: appFontFamily),),
                value: "EasyPaisa",
                groupValue: selectedMethod,
                onChanged: (value){
                  setState(() {
                    selectedMethod = value;
                  });
                }),
            const SizedBox(height: 20.0,),
            CustomButton(
                onPressed: (){
                  if(selectedMethod != null){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pay(
                          selectedMethod: selectedMethod,
                          amount: widget.amount,
                        )));
                    print(selectedMethod);
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Select a Method", style: TextStyle(fontFamily: appFontFamily),)));
                  }
                },
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                child: const Text("Pay Now",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),))
          ],
        ),
      ),
    );
  }
}
