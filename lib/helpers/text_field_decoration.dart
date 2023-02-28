import 'package:flutter/material.dart';

class TextFieldDecoration {
  final String? _errorUserNameText;
  final String? _labelText;
  TextFieldDecoration(this._errorUserNameText, this._labelText);

  InputDecoration decoration() {
    InputDecoration _decoration = InputDecoration(
        isCollapsed: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        labelText: _labelText,
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        errorText: _errorUserNameText,
        errorStyle: const TextStyle(color: Colors.red));

    return _decoration;
  }
}
