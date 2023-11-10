import 'package:e_ommerce_app/view/home.dart';
import 'package:e_ommerce_app/view/login_and_reg/register_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


void main(){
  runApp(GetMaterialApp(home: LoginPage(),));
}

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final emailc = TextEditingController();
  final passc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xff080414),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 18, bottom: 20),
          decoration: BoxDecoration(
            color: Color(0xff181c2c),
            borderRadius: BorderRadius.circular(10)),
          height: 530,
          width: 350,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade900),
                      color: Color.fromARGB(255, 5, 42, 8),
                      borderRadius: BorderRadius.circular(50)
                      ),
                    child: Icon(
                      Icons.person_2_outlined, 
                      size: 28,
                      color: Colors.cyan[400],),
                  ),
                  SizedBox(width: 20,),
                  Text("Log in", style: TextStyle(color: Colors.grey[200], fontWeight: FontWeight.bold, fontSize: 23, letterSpacing: 1.2),),
                ],
              ),
                SizedBox(height: 15,),

                Text("Please enter the email and password  you used to create account.", style: TextStyle(letterSpacing: 1.1,color: Colors.grey[400], fontSize: 16, fontWeight: FontWeight.bold, height: 1.5)),
                SizedBox(height: 15,),

                Divider(color: Colors.grey[600],),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Email", style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),),
                  Text("Required", style: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.bold),),
                ],),

                SizedBox(height: 12,),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff080414),
                    borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    controller: emailc,
                    style: TextStyle(color: Colors.grey[600]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      isDense: true,
                      hintStyle: TextStyle(color: Colors.grey[700],letterSpacing: 1.2, fontWeight: FontWeight.bold),
                      hintText: "Your email", 
                      fillColor: Colors.green),
                  ),
                ),

            SizedBox(height: 20),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Password", style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),),
                  Text("Required", style: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.bold),),
                ],),

                SizedBox(height: 12,),

                Container(
                  decoration: BoxDecoration(
                    // color: Color(0xff080414),
                    borderRadius: BorderRadius.circular(25)),
                  child: TextField(
                    controller: passc,
                    obscureText: true,
                    style: TextStyle(color: Colors.grey[600]),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      isDense: true,
                      hintStyle: TextStyle(color: Colors.grey[700],letterSpacing: 1.2, fontWeight: FontWeight.bold),
                      hintText: "Your Password",
                      fillColor: Color(0xff080414),
                      filled: true,
                      
                      ),
                  ),
                ),

                SizedBox(height: 12,),

              Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () async{
                  String email = emailc.text.trim();
                  String pass = passc.text.trim();

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
                    Get.to(Home());
                  }on FirebaseAuthException catch (e) {
                    Get.snackbar("Error", e.message!);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.cyan[600],
                  borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),


              Divider(color: Colors.grey[600]),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",style: TextStyle(letterSpacing: 1.1,color: Colors.grey[400], fontSize: 16, fontWeight: FontWeight.bold,)),
                  
                  TextButton(onPressed: (){
                    Get.to(RegisterPage());
                  }, child: Text("Register", style: TextStyle(color: Colors.cyan[600], fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1,),))
                ],
              )

            ],
          ),
        ),
      )
    );
  }
}