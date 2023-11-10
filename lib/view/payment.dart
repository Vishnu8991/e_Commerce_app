import 'package:e_ommerce_app/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main(){
//   runApp(GetMaterialApp(home: Payments,));
// }

class Payments extends StatelessWidget {
  // const Payments({super.key});
  final double totalAmount;

  Payments({required this.totalAmount, super.key});

  final PaymentController paymentController = Get.put(PaymentController());

   var payments = [
    "Wallet / Postpaid",
    "Credit / Debit / ATM Card",
    "Net BAnking",
    "EMI (Easy Installments)",
    "Upi",
    "Cash on Delivery"
   ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(title: Text("Payments"), backgroundColor: Colors.transparent, elevation: 0,),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.grey,),
              SizedBox(height: 8),
              Text("All options", style: TextStyle(color: Colors.grey[200], fontSize: 19),),
              SizedBox(height: 8),
              Divider(color: Colors.grey,),
              Obx(
                () => Column(
                  children: List.generate(
                    payments.length,
                    (index) => RadioListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(payments[index],style: TextStyle(color: Colors.grey[300], fontSize: 18),),
                      ),
                      value: index,
                      groupValue: paymentController.selectedPayment.value,
                      onChanged: (int? value) {
                        paymentController.selectPayment(value!);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Divider(thickness: 8,color: Colors.grey[800],),
              SizedBox(height: 8),

              Container(
                height: 50,
                color: Colors.grey[600],
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                 
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Secure",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Text("Payments",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                       Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Authentic",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Products",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Easy",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,)),
                        Text("Returns",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 30),
              Spacer(),

              Container(
                height: 50,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/img/visa.png"),
                    Image.asset("assets/img/rupay.png"),
                    Image.asset("assets/img/american.png"),
                    Image.asset("assets/img/western.png"),
                    Image.asset("assets/img/paypal.png"),
                  ],
                ),
              ),
              Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                color: Colors.grey[100],
                height: 55,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("\$${totalAmount.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.1),),
                  Spacer(),
                    Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text(
                    "Pay",
                    style: TextStyle(color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(color: Colors.yellow[700],
                  // borderRadius: BorderRadius.circular(20)
                  ),
                ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}