import 'package:flutter/material.dart';

import '../styles/colors.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
        title: const Text("History"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            ListTile(
              textColor: Colors.white,
              tileColor: Colors.teal,
              title: Text("Demo 1"),
              subtitle: Text("12345678912"),
              trailing: Text("1000"),
            ),
            SizedBox(height: 5.0,),
            ListTile(
              textColor: Colors.white,
              tileColor: Colors.blueGrey,
              title: Text("Demo 2"),
              subtitle: Text("12345678912"),
              trailing: Text("5000"),
            ),
            SizedBox(height: 5.0,),
            ListTile(
              textColor: Colors.white,
              tileColor: Colors.brown,
              title: Text("Demo 3"),
              subtitle: Text("12345678912"),
              trailing: Text("3000"),
            ),
            SizedBox(height: 5.0,),
            ListTile(
              textColor: Colors.white,
              tileColor: Colors.pinkAccent,
              title: Text("Demo 4"),
              subtitle: Text("12345678912"),
              trailing: Text("800"),
            ),
            SizedBox(height: 5.0,),
            ListTile(
              textColor: Colors.white,
              tileColor: Colors.green,
              title: Text("Demo 5"),
              subtitle: Text("12345678912"),
              trailing: Text("6000"),
            ),
          ],
        ),
      ),
    );
  }
}
