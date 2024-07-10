import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanqr extends StatefulWidget{
  @override
  _Scanqr createState()=> _Scanqr();
}
class _Scanqr extends State<Scanqr>{
  String _qrResult = 'Scan data will be here';

  Future<void> scanQR()async{
    try{
      final qrRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', "Cancel", true, ScanMode.QR);
      setState((){
        _qrResult = qrRes.toString();
      });
    }on PlatformException{
      setState(() {
        _qrResult = 'Failed to load data';
      });
    }
    if(!mounted) return;

}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:const Text('QR Scanner',
            style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold
            )),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white
        )
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: const Text('QR-Scanner', style: TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                  ))
              ),
              Container(
                height: 280,
                alignment: Alignment.center,
                child: Text('$_qrResult', style: TextStyle(
                  fontSize: 22, color: Colors.black,
                ))
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child:const Text('Scan', style: TextStyle(
                    fontSize: 22,
                    color: Colors.white
                  )),
                  onPressed: scanQR
                )
              )
            ]
          )
        )
      )
    );
  }
}