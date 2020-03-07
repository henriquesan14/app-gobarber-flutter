import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool obscure;
  final bool autoCorrect;
  final TextInputType tipo;
  final TextInputAction inputAction;
  final Function onSubmitted;
  final Function onChanged;
  final TextEditingController controller;
  final FocusNode focus;
  final Function validator;
  final String initialValue;

  InputField({this.hint, this.icon, this.obscure = false, this.autoCorrect = false, this.tipo, this.inputAction, this.focus, this.onSubmitted, this.onChanged , this.controller, this.validator, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      focusNode: focus,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      keyboardType: tipo,
      textInputAction: inputAction,
      autocorrect: autoCorrect,
      obscureText: obscure,
      style: TextStyle(color: Colors.white, fontSize: 15),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white, fontSize: 15),
        filled: true,
        fillColor: Color.fromRGBO(0, 0, 0, 0.1),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 12
        )
      ),
    );
  }
}