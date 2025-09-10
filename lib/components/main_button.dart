import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final OutlinedBorder shape;

  const MainButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColours.white,
    this.textStyle = TextStyles.size16SofiaPro,
    this.padding = const EdgeInsets.symmetric(vertical: 12),
    this.shape = const RoundedRectangleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: shape,
        ),
        child: Text(label, style: textStyle),
      ),
    );
  }
}
