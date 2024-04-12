import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final LinearGradient buttonGradient;
  final EdgeInsetsGeometry margin;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Widget icon;
  final bool isLoading;

  const CustomButton({
    required this.buttonText,
    this.buttonTextColor = Colors.white, // Default color set to white
    this.buttonGradient = const LinearGradient(
      colors: [Color(0xFF5F9DCF), Color(0xFF1565C0)],
    ),
    this.margin = const EdgeInsets.all(0), // Default margin to 0
    required this.onPressed,
    this.borderColor = const Color(0xFF1565C0), // Default border color
    this.borderWidth = 1.0, // Default border width
    this.borderRadius = 8.0, // Default border radius
    this.icon = const SizedBox(width: 0, height: 0), // Default icon as an empty space
    this.isLoading = false, // Default loading state
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity, // Ensures it takes the full width available
      margin: margin,
      decoration: BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed, // Disables onTap when isLoading is true
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(strokeWidth: 3.0, color: buttonTextColor), // Use button text color for consistency
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(width: 8),
                      Text(
                        buttonText,
                        style: TextStyle(color: buttonTextColor, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
