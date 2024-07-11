import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:qr_code/widgets/MyButton.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generateqr extends StatefulWidget{
  @override
  _Generateqr createState()=> _Generateqr();
}
class _Generateqr extends State<Generateqr>{
  String _qrData = '';
  Color color = Colors.orange;
  Color picBtn = Colors.white;
  TextEditingController _dataCont = TextEditingController();

  Widget PickerColor(){
      return ColorPicker(
          pickerColor: color,
          onColorChanged: (picColor){
            setState((){
              color = picColor;
              picBtn = picColor;
            });
          }
      );
  }

  colorPick(){
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text('Please Pick a color!'),
        content: PickerColor(),
        actions: [
          TextButton(
            child:const Text('Select', style: TextStyle(fontSize: 22, color: Colors.orange)),
            onPressed: (){

              Navigator.of(context).pop();
            }
          ),
          TextButton(
            child: Text('Cancel', style: TextStyle(fontSize: 22, color: Colors.red)),
            onPressed: (){
              Navigator.of(context).pop();
            }
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context){
    final wid = MediaQuery.of(context).size.width;
    final hei = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title:const Text('Generate QR Code',
            style: TextStyle(
                fontSize: 23,
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
                // Container(
                //   alignment: Alignment.center,
                //   child: const Text('QR Generator', style: TextStyle(
                //     fontSize: 35,
                //     color: Colors.orange,
                //     fontWeight: FontWeight.bold
                //   ))
                // ),
                Container(
                  height: hei/2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Container(
                    height: 250,
                    width: 250,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
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
                      foregroundColor: color,
                    )
                        :const Text('Please enter some data!',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange
                      ),)
                ),
                    ]
                  )
                ),

                Container(
                  width: (wid/100)*98,
                  height: hei/2,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        color: Colors.grey,
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      //input section
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    padding: EdgeInsets.only(left: 25, right: 25),
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
                          filled: true,
                          fillColor: Colors.white,
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
                 Container(
                   width: 300,
                   child: ElevatedButton(
                     child: Text('Pick a Color', style: TextStyle(
                         fontSize: 22,
                         color:picBtn != Colors.white ? Colors.white : Colors.orange
                     )),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: picBtn,
                       shape: RoundedRectangleBorder(
                         side: BorderSide(
                           color: picBtn,
                           width: 2
                         ),
                         borderRadius: BorderRadius.circular(10)
                       )
                     ),
                       onPressed: (){
                          colorPick();
                     }
                   )
                 ),
                 //input button
                Container(
                  width: 300,
                  child: ElevatedButton(
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
                ),
                    ]
                  )
                )

              ]
            )
        )
      ))
    );
  }
}
