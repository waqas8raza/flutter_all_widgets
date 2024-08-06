import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
 final String? hintText;
 final String? lableText;
 final IconData? prefixIcon;
 final bool? isObscure ;
  AppTextField(
      {super.key,
      this.hintText,
      this.lableText,
      this.prefixIcon,
      this.isObscure=false});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure!,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.lableText,
          prefixIcon:
              widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
          filled: true,
          isDense: true,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blueGrey)),
          fillColor: const Color.fromARGB(255, 193, 212, 245),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
