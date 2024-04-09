import 'package:flutter/material.dart';
import '../../customWidgets.dart';
import '../../styles/colors.dart';
import 'paymentoptions.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();

  String? selectedHead;
  List<Map<String, dynamic>> listItems = [];


  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (var itemData in listItems) {
      int price = int.tryParse(itemData['amount']) ?? 0;
      totalPrice += price;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
      ),
      body: Column(
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
                Text("Head", style: TextStyle(fontSize: 18.0,
                  fontWeight: FontWeight.bold, fontFamily: appFontFamily,)),
                Text("Amount", style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              var itemData = listItems[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                decoration: BoxDecoration(
                  color: index.isEven? const Color(0xFFFFF476) :const Color(0xFFA7FEEB),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(itemData['head'],
                        style: const TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
                    Text(itemData['amount'],
                        style: const TextStyle(fontSize: 15.0,
                            fontWeight: FontWeight.bold, fontFamily: appFontFamily)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBarColor,
        onPressed: (){
          addPayment();
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
            CustomButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectPayment(amount: totalPrice,)));
                },
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: const Text("Pay Now",
                  style: TextStyle(color: Colors.white,fontSize: 20.0,
                      fontWeight: FontWeight.bold, fontFamily: appFontFamily),)
            ),
          ],
        ),
      ),
    );
  }


  Future<void> addPayment()async{
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
                    listItems.add({
                     "head" : selectedHead,
                      "amount" : amountController.text,
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


}
