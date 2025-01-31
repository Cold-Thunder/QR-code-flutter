import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/activities/GenerateQR.dart';
import 'package:qr_code/activities/ScanQR.dart';
import 'package:qr_code/widgets/MyButton.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner & Generator',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.orange,
        elevation: 3.0,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  child:const Text('Welcome to QR-Scanner',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold
                      ))
                ),
                MyButton(name: 'Generate QR Code', navi: Generateqr()),
                SizedBox(height: 20),
                MyButton(name: 'Scan QR Code', navi: Scanqr()),
              ]
            )
          )
        )
      )
    );
  }
}