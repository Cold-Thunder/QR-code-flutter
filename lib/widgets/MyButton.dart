import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final String name;
  final navi;

  const MyButton({
    super.key,
    required this.name,
    required this.navi
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      child: Text('${name}', style: TextStyle(
        fontSize: 22,
        color: Colors.white
      )),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context)=>navi)
        );
      }
    );
  }
}