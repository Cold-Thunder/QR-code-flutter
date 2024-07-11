import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Widget ColorPic(){
    return ColorPicker(
        pickerColor: pickerColor,
        onColorChanged: onColorChanged
    );
}