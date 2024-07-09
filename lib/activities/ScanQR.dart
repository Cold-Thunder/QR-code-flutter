import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scanqr extends StatefulWidget{
  @override
  _Scanqr createState()=> _Scanqr();
}
class _Scanqr extends State<Scanqr>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('QR Scaner',style: TextStyle(fontSize: 22, color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      )
    );
  }
}