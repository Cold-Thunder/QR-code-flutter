// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_code/widgets/MyButton.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class Generateqr extends StatefulWidget{
  @override
  _Generateqr createState()=> _Generateqr();
}
class _Generateqr extends State<Generateqr>{
  String _qrData = '';
  Color _selColor = Colors.orange;
  Color color = Colors.orange;
  Color picBtn = Colors.white;
  TextEditingController _dataCont = TextEditingController();
  GlobalKey _globalKey = GlobalKey();

  Widget PickerColor(){
      return ColorPicker(
          pickerColor: color,
          onColorChanged: (picColor){
            setState((){
              color = picColor;
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
              setState((){
                _selColor = color;
              });
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

  Future _saveQR()async{
    try{
      RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
      await (image.toByteData(format: ui.ImageByteFormat.png));
      if (byteData != null) {
        final result =
        await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
        print(result);
      }
      Fluttertoast.showToast(
        msg: 'QR Saved!',
        backgroundColor: Colors.orange,
        fontSize: 22,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM
      );
    }catch(err){
      print('error in saving data $err');
    }
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
                    child: _qrData != '' ?
                    RepaintBoundary(
                      key: _globalKey,
                      child: QrImageView(
                      data: _qrData,
                      size: 200.0,
                      foregroundColor: _selColor,
                    ))
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
                         color:_selColor != Colors.white ? Colors.white : Colors.orange
                     )),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: _selColor,
                       shape: RoundedRectangleBorder(
                         side: BorderSide(
                           color: _selColor,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      color: Colors.orange,
                                    )
                                ),
                              ),
                              child: Text('Save', style: TextStyle(
                                fontSize: 22,
                                color: Colors.orange,
                              )),
                              onPressed:(){
                                _saveQR();
                              }
                          )
                      ),
                      Container(
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


