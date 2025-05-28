import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
     const CustomTextField({super.key, this.hint,this.onChanged,this.controller,this.obscureText=false,this.textInputType});
 final String? hint;
 final TextEditingController? controller;
 final bool? obscureText;
final Function(String)? onChanged;
final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: obscureText!,
      controller:  controller,
      keyboardType: textInputType,

      onChanged: onChanged,
      decoration: InputDecoration(
      hintText:hint ,

      border: OutlineInputBorder(
          borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(8),

      ),

    ),);
  }
}
