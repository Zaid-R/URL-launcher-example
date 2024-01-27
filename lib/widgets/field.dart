import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class Field extends StatefulWidget {
  final String title;
  final double width;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final bool isPassword;
  bool _isObscureText;

  Field({
    super.key, 
    required this.title,
    required this.width,
    required this.validator,
    this.controller,
    this.isPassword = false,
  }):_isObscureText = isPassword;
  
  @override
  State<StatefulWidget> createState()=>_FieldState();
}

class _FieldState extends State<Field>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        cursorColor:Colors.grey[700],
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget._isObscureText,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: themeColor
            )
          ),
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          labelText: widget.title,
          labelStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          suffixIcon:widget.isPassword? IconButton(
            icon: Icon(
               widget._isObscureText
               ? Icons.visibility
               : Icons.visibility_off,
               color: Colors.black87,
               ),
            onPressed: () =>setState(() => widget._isObscureText=!widget._isObscureText),
            ):null
        ),
      ),
    );
  }
}
