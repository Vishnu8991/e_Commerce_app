import 'package:e_ommerce_app/view/car.dart';
import 'package:e_ommerce_app/view/home.dart';
import 'package:e_ommerce_app/view/login_and_reg/login.dart';
import 'package:e_ommerce_app/view/search.dart';
import 'package:e_ommerce_app/view/wishlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(MaterialApp(home: Drawerr(),debugShowCheckedModeBanner: false,));
}

class Drawerr extends StatelessWidget{


  String getUserName() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null ? user.displayName ?? "No Name" : "No User";
  }


  @override
  Widget build (BuildContext context){
    return 
      Drawer(
        child: Container(padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(color: Colors.black
          //   gradient: 
          // LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.black,
          //     Colors.grey.shade900
          //   ])
            ),
          child: ListView(
            children: [SizedBox(height: 60,),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(right: 10,),
                ),
                title: Text(
                  getUserName()
                  ,style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1.2),),
              ),
              // SizedBox(height: 20,),

              Divider(color: Colors.grey[100]),

              SizedBox(height: 30,),

              
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: ()=> Get.to(Home()),
                          child: ListTile(  
                            leading: Icon(Icons.home,color: Colors.white,),
                            title: Text("Home",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: ()=> Get.to(SearchPage()),
                          child: ListTile(  
                            leading: Icon(Icons.search,color: Colors.white,),
                            title: Text("Search",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => Get.to(Car()),
                          child: ListTile(  
                            leading: Icon(Icons.shopping_cart,color: Colors.white,),
                            title: Text("Shopping Cart",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => Get.to(Wishlist()),
                          child: ListTile(  
                            leading: Icon(Icons.favorite,color: Colors.white,),
                            title: Text("Wishlist",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
            SizedBox(height: 160,),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                Get.to(LoginPage());
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 159, 17, 9),
                  borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )

            ],
          ),
        ),
      );
      
  }
}