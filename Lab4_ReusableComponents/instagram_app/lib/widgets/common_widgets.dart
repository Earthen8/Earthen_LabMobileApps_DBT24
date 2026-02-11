import 'package:flutter/material.dart';
import '../core/colors.dart';

class InstagramTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const InstagramTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 1),
      borderRadius: BorderRadius.circular(12),
    );

    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: AppColors.primaryColor),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 14,
        ),
        fillColor: AppColors.inputFillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AppColors.inputBorderColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}

class InstagramButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;
  final double borderRadius;

  const InstagramButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height = 44.0,
    this.borderRadius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: double.infinity,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.loginButtonColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
