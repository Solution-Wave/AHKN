import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../customWidgets.dart';
import '../../styles/colors.dart';

class Pay extends StatefulWidget {
  final String? selectedMethod;
  final int? amount;
  const Pay({super.key, required this.selectedMethod, required this.amount});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {

  File? image;
  bool isImageSelected = false;

  Future pickImage() async {
    print('picking image from gallery');
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) return;
      final imagePermanent = File(img.path);
      setState(() {
        image = imagePermanent;
        isImageSelected = true;
      });
    } catch (e) {
      print(e);
      debugPrint(e.toString());
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
        title: const Text("Pay", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20.0,),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black12,
                ),
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Selected Account: ${widget.selectedMethod}",
                      style: const TextStyle(fontSize: 18.0, fontFamily: appFontFamily),
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "Account Title: AHKN",
                      style: TextStyle(fontSize: 18.0, fontFamily: appFontFamily),
                    ),
                    const SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Ac Number: 01234558556165",
                          style: TextStyle(fontSize: 18.0, fontFamily: appFontFamily),
                        ),
                        const SizedBox(width: 5.0,),
                        InkWell(
                          onTap: () {
                            _copyToClipboard("01234558556165");
                          },
                          child: const Icon(Icons.copy, size: 20.0,),
                        )
                      ],
                    ),

                  ],
                ),

              ),
            ),
            const SizedBox(height: 30.0,),
            const Center(
              child: Text("Upload Payment Proof",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),),
            ),
            const SizedBox(height: 10.0,),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1.5, color: Colors.black12)),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Image.asset(''),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        width:
                        MediaQuery.of(context).size.width / 1.9,
                        // alignment: Alignment.centerLeft,
                        child: image != null
                            ? Image.file(
                          image!,
                          fit: BoxFit.fill,
                        )
                            : const Center(
                          child: Text('Upload Image', style: TextStyle(fontFamily: appFontFamily),),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 6),
                    child: InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: const CircleAvatar(
                          radius: 23,
                          child: Icon(Icons.camera_alt)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30.0,),
            isImageSelected ? CustomButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Thank You", style: TextStyle(fontFamily: appFontFamily),)));
                },
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                child: const Text("Transfer Funds", style: TextStyle(fontFamily: appFontFamily),)) : Container()
          ],
        ),
      ),
    );
  }
}
