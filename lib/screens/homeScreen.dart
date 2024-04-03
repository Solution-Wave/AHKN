import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/colors.dart';
import 'contactus.dart';
import 'history.dart';
import 'payments/paymentoptions.dart';
import 'payments/payments.dart';
import 'profileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Color> color = const [
    Color(0xFFCC8196),
    Color(0xFFCDFF90),
    Color(0xFF5DCAF4),
    Color(0xFFF28B82),
    Color(0xFFD7AEFC),
  ];
  List<Icon> icons = const [
    Icon(Icons.account_circle),
    Icon(Icons.payments),
    Icon(Icons.history),
    Icon(Icons.contact_support),
    Icon(Icons.monetization_on),
  ];

  List<String> texts = [
    "Personal Details",
    "Payments",
    "History",
    "Contact Us",
    "Membership Fee"
  ];

  List<Widget> screens = const [
    ProfileScreen(),
    Payments(),
    History(),
    ContactUs(),
    SelectPayment()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
        leading: ClipOval(
          child: Image.asset("assets/ahkn.jpg"),
        ),
        title: const Text("Welcome To AHKN", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0,),
            GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              itemCount: color.length, // Ensure itemCount is specified
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> screens[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: color[index],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index].icon,
                            size: 50.0,
                            color: Colors.white,
                          ),
                          Text(texts[index],
                            style: const TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: appFontFamily),)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.phone),
              onPressed: makingPhoneCall,
            ),
            IconButton(
              icon: const Icon(Icons.textsms),
              onPressed: sendingSMS,
            ),
            IconButton(
              icon: const Icon(Icons.phone_android_sharp),
              onPressed: _openWhatsApp,
            ),
          ],
        ),
      ),


    );
  }

  sendingSMS() async {
    var url = Uri.parse("sms:+923008497241");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  makingPhoneCall() async {
    var url = Uri.parse("tel:+923008497241");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openWhatsApp() async {
    String phoneNumber = "923008497241";
    String message = "Hello, this is a test message.";
    String url = "https://wa.me/$phoneNumber/?text=${Uri.parse(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
