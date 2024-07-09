import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Generateqr extends StatefulWidget{
  @override
  _Generateqr createState()=> _Generateqr();
}
class _Generateqr extends State<Generateqr>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Generate QR',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white)),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Center(

        )
      )
    );
  }
}