import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  final Function(String?) onChanged;
  final String hintText;
  final TextEditingController controller;
  final void Function()? onTap;
  const SearchFormField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        border: const OutlineInputBorder(),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
