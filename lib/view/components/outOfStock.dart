import 'package:flutter/material.dart';

class OutOfStock extends StatelessWidget {
  const OutOfStock({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.grey[700],
    appBar: AppBar(title: Text("Iphones"),backgroundColor: Colors.transparent, elevation: 0,),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.dangerous, color: Colors.red,size: 80,),
            SizedBox(height: 15,),
            Text("Currently out of Stock", style: TextStyle(fontSize: 28),),
          ],
        ),
      ),
    ));
  }
}