import 'package:flutter/material.dart';
import 'package:myhotel/utils/Globals.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconTap;
  final TextEditingController controller;
  final String? errorText;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.prefixIcon,
    this.onPrefixIconTap,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      // Only dispose it if the widget didn't provide a focus node
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      // Trigger a rebuild when the focus changes
      setState(() {});
    } else {
      setState(() {});
    }
  }

  Color get _dynamicColor => _focusNode.hasFocus ? Globals.primaryColor : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Globals.backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: Offset(0, 4),
            blurRadius: 33,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: _dynamicColor,
        style: TextStyle(color: _dynamicColor),
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: _focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: _dynamicColor.withOpacity(0.7)),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: _dynamicColor),
          contentPadding: const EdgeInsets.fromLTRB(15, 11, 15, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: widget.prefixIcon != null
              ? InkWell(
                  onTap: widget.onPrefixIconTap,
                  child: Icon(widget.prefixIcon, color: _dynamicColor, size: 18),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? InkWell(
                  onTap: widget.onSuffixIconTap,
                  child: Icon(widget.suffixIcon, color: _dynamicColor, size: 18),
                )
              : null,
          errorText: widget.errorText,
          filled: true,
          fillColor: Globals.backgroundColor.withOpacity(0.75),
        ),
      ),
    );
  }
}
