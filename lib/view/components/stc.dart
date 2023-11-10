import 'package:flutter/material.dart';

class Stacks extends StatelessWidget {
  final txt;
  final stxt1;
  final stxt2;
  final col;
  final col1;
  final elevatedc;
  final img;
  final l;
  final h;
  final t;

  const Stacks({super.key, this.txt, this.stxt1, this.stxt2, this.col, this.col1, this.elevatedc, this.img, this.l, this.h, this.t});
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            height: 160,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(child: Container(
            height: 150,width: 360,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                col,
                col1
                // Colors.grey.shade900,
                // Colors.grey.shade400
              ])
            ),
          ),
          top: 25,
          ),
        Positioned(
                left: 22,
                top: 50 ,
                  child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // Text("New Collection",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 2)),
                  Text(txt,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 2, color: Colors.white)),
                  SizedBox(height: 10,),
                  Text(stxt1, style: TextStyle(color: Colors.white, letterSpacing: 1),),
                  SizedBox(height: 5),
                  Text(stxt2, style: TextStyle(color: Colors.white, letterSpacing: 1),),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: (){}, 
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(elevatedc)),
                  child: Text("Shop Now"))
                  ],)
                ),
        Positioned(
          left: l.toDouble(),
          top: t.toDouble() ,
          child: Image.asset(img, height: h.toDouble(),))
      ],
    );
  }
}