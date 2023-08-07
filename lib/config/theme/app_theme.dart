import 'package:flutter/material.dart';
 const Color _customColor = Color(0xFF5C114D);


const List<Color> _colorthemes=[
    _customColor ,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.pink,

  ];


class AppTheme{

 final int selectedColor ;

  AppTheme({this.selectedColor = 0}):assert(selectedColor>= 0 , 'Colors must be between 0 and ${_colorthemes.length}');

  ThemeData theme (){
    return ThemeData(
      useMaterial3: true,
     colorSchemeSeed: _colorthemes[selectedColor],
    
    );
  }
}

