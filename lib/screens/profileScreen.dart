import 'package:flutter/material.dart';
import '../styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0,),
            Center(
              child: ClipOval(
                child: Container(
                  height: 200.0,
                    width: 200.0,
                    child: Image.asset("assets/ahkn.jpg")),
              ),
            ),
            const Padding(
              padding:EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.black54,
                title: Text("User Name",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
                trailing: Text("AHKN",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
              ),
            ),
            const Padding(
              padding:EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.black54,
                title: Text("CNIC",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
                trailing: Text("12345-1236854-0",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
              ),
            ),
            const Padding(
              padding:EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.black54,
                title: Text("Email",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
                trailing: Text("demo@gmail.com",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
              ),
            ),
            const Padding(
              padding:EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.black54,
                title: Text("Phone",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
                trailing: Text("0300-1234567",
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: appFontFamily)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
