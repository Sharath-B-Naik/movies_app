import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool isPassword;
  final VoidCallback? onEyeTap;
  const AppTextField({
    Key? key,
    this.controller,
    this.onChanged,
    required this.hintText,
    this.isPassword = false,
    this.onEyeTap,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: widget.isPassword ? showPassword : false,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              hintText: widget.hintText,
              border: InputBorder.none,
            ),
          ),
        ),
        widget.isPassword
            ? GestureDetector(
                onTap: () {
                  if (widget.isPassword) {
                    showPassword = !showPassword;
                    setState(() {});
                  }
                },
                child: Icon(
                  showPassword ? Icons.password_rounded : Icons.remove_red_eye,
                  color: Colors.orange,
                  size: 20,
                ),
              )
            : const SizedBox(),
        const SizedBox(width: 20)
      ],
    );
  }
}
