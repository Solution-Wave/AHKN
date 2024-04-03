import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../customWidgets.dart';
import '../../styles/colors.dart';
import '../homeScreen.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String? selectedType;
  String? selectedGender;

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bradriNoController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register", style: TextStyle(fontFamily: appFontFamily),),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: appBarColor1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15.0,),
                    CustomDropdownButtonFormField(
                      value: selectedType,
                      hintText: "Select Type",
                      labelText: "Type",
                      prefixIcon: Icon(Icons.merge_type, color: iconColor,),
                      onChanged: (value){
                        setState(() {
                          selectedType = value;
                        });
                      },
                      items: <String>[
                        "Bradri",
                        "Syed",
                        "Non Syed",
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          alignment: AlignmentDirectional.center,
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    selectedType == "Bradri" ? Column(children: [
                      const SizedBox(height: 10.0,),
                      CustomTextFormField(
                          controller: bradriNoController,
                          labelText: "Bradri Number",
                          hintText: "Bradri Number",
                          prefixIcon: Icon(Icons.family_restroom, color: iconColor,),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Your Bradri Number";
                            }
                            return null;
                          }
                      )
                    ],): Container(),
                    const SizedBox(height: 10.0,),
                    Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text("Male"),
                          value: "Male",
                          groupValue: selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text("Female"),
                          value: "Female",
                          groupValue: selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                    CustomTextFormField(
                        controller: nameController,
                        labelText: "Name",
                        hintText: "Name",
                        prefixIcon: Icon(Icons.person, color: iconColor,),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your Name";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 10.0,),
                    CustomTextFormField(
                        controller: fNameController,
                        labelText: "Father Name",
                        hintText: "Father Name",
                        prefixIcon: Icon(Icons.person_2, color: iconColor,),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your Father Name";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 10.0,),
                    CustomTextFormField(
                        controller: cnicController,
                        labelText: "CNIC Number",
                        hintText: "CNIC Number",
                        prefixIcon: Icon(Icons.credit_card, color: iconColor,),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your CNIC Number";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 10.0,),
                    CustomTextFormField(
                        controller: phoneController,
                        labelText: "Phone Number",
                        hintText: "03*********",
                        prefixIcon: Icon(Icons.phone, color: iconColor,),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your Phone Number";
                          }
                          return null;
                        }
                    ),
                    const SizedBox(height: 10.0,),
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
                        }
                    ),
                    const SizedBox(height: 10.0,),
                    CustomTextFormField(
                        controller: cityController,
                        labelText: "City",
                        hintText: "City",
                        prefixIcon: Icon(Icons.location_city, color: iconColor,),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Your City Name";
                          }
                          return null;
                        }
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
                        child: const Text("Register",
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: "Comfortaa"),)
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have An Account?", style: TextStyle(fontFamily: appFontFamily),),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                            },
                            child: const Text("Login", style: TextStyle(fontFamily: appFontFamily),))
                      ],
                    ),
                    const SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
