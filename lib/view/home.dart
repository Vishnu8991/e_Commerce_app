import 'package:e_ommerce_app/controller/data_controller.dart';
import 'package:e_ommerce_app/controller/product_controller.dart';
import 'package:e_ommerce_app/models/product_model1.dart';
import 'package:e_ommerce_app/view/car.dart';
import 'package:e_ommerce_app/view/components/apple_sec.dart';
import 'package:e_ommerce_app/view/components/carou.dart';
import 'package:e_ommerce_app/view/components/categories.dart';
import 'package:e_ommerce_app/view/components/festive.dart';
import 'package:e_ommerce_app/view/components/outOfStock.dart';
import 'package:e_ommerce_app/view/components/top_selection.dart';
import 'package:e_ommerce_app/view/components/viewAll.dart';
import 'package:e_ommerce_app/view/drawer.dart';
import 'package:e_ommerce_app/view/search.dart';
import 'package:e_ommerce_app/view/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ma", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey[700], letterSpacing: 7),),
              Text("X", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue, letterSpacing: 8),),
              Text("x", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey[700], letterSpacing: 7),),
            ],
          ),centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [IconButton(onPressed: (){
            Get.to(Car());
          }, icon: Icon(Icons.shopping_cart, color: Colors.green[400],)),SizedBox(width: 10,)],
        ),drawer: Drawerr(),
        // Drawer(
          // backgroundColor: Colors.black,
          // child: Column(
          //   children: [
          //     Text("Mickey", style: TextStyle(color: Colors.white),),
          //     Divider(),
              
          //   ],
          // ),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                hintText: "What are you looking for?",
                prefixIcon: Icon(Icons.search_sharp, color: Colors.black, size: 25,),
                ),
                onTap: () {
                  Get.to(SearchPage());
                },
              ),
              
    
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: ()=> Get.to(ViewAll()),
                        child: Carousal()),

                      SizedBox(height: 10,),
                      
                      // Categories(),
                      
                      // SizedBox(height: 12,),
                      
                      Top_Selection(),

                      SizedBox(height: 28,),

                      GestureDetector(
                        onTap: () => Get.to(OutOfStock()),
                        child: Apple()),
                      
                      SizedBox(height: 28,),
                      
                      Festive(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
 var screens  = [
  Home(),
  SearchPage(),
  Wishlist(),
  Car()
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.black,
          selectedItemColor: Colors.cyan[800],
          currentIndex: index,
          onTap: (tappedindex) {
            setState(() {
              index = tappedindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart')
          ]),


      body:Center(
        child: screens[index],
      ),
    );
  }
}