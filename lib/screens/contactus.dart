import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
    );
  }
}