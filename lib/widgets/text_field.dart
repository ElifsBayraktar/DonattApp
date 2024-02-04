// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labeltext,
    required this.icon,
    this.controller,
    this.validator,
    required this.obsecureText,
  }) : super(key: key);

  final String labeltext;
  final Icon icon;
  final TextEditingController? controller;
  final Function(String)? validator;
  final bool obsecureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: size.width * 0.05),
      child: Container(
        height: size.height * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0.5),
              ),
            ],
            color: Colors.white),
        child: TextFormField(
          obscureText: widget.obsecureText,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.icon,
            labelText: widget.labeltext,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
