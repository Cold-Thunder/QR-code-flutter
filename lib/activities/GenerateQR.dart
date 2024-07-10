import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_code/widgets/MyButton.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generateqr extends StatefulWidget{
  @override
  _Generateqr createState()=> _Generateqr();
}
class _Generateqr extends State<Generateqr>{
  String _qrData = '';
  TextEditingController _dataCont = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('Generate QR',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold
            )),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text('QR Generator', style: TextStyle(
                    fontSize: 35,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold
                  ))
                ),
                Container(
                  height: 250,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(0,1),
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: _qrData != '' ? QrImageView(
                    data: _qrData,
                    size: 200.0,
                    foregroundColor: Colors.orange,
                  )
                      :const Text('Please enter some data!',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.orange
                    ),)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(left: 30, right: 30),
                  height: 50,
                  child: TextField(
                    controller: _dataCont,
                    style: TextStyle(
                      fontSize: 22, color: Colors.orange
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter your data!',
                      labelStyle: TextStyle(
                        color: Colors.orange,
                        fontSize: 22
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  )
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    onPressed: (){
                      setState((){
                        _qrData = _dataCont.text.toString();
                      });
                      _dataCont.clear();
                      FocusScope.of(context).unfocus();
                    },
                    child: Text('Generate', style: TextStyle(fontSize: 22, color: Colors.white))
                )
              ]
            )
        )
      ))
    );
  }
}