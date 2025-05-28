import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
     const CustomButton({super.key,  required this.text,this.ontap});
 final String text;
final VoidCallback? ontap;
    @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity ,
        height: 60,
        child:  Center(child:  Text(text,style: const TextStyle(color: Colors.white),)),
      ),
    );
  }

}
