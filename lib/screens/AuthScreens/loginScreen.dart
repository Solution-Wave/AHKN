import 'package:flutter/material.dart';
import '../../customWidgets.dart';
import '../../styles/colors.dart';
import '../homeScreen.dart';
import 'registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0,),
                      Center(
                        child: ClipOval(
                          child: Container(
                              height: 200.0,
                              width: 200.0,
                              child: Image.asset("assets/ahkn.jpg")),
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                      CustomTextFormField(
                          controller: emailController,
                          labelText: "Email",
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail, color: iconColor,),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Your Email Address";
                            }
                            return null;
                          }, keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 10.0,),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Your Password";
                            }
                            return null;
                          },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: iconColor,),
                            labelText: "Password",
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      CustomButton(
                          onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                          child: const Text("Login",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: appFontFamily),)
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have Account?", style: TextStyle(fontFamily: appFontFamily),),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
                              },
                              child: const Text("Register", style: TextStyle(fontFamily: appFontFamily),))
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
