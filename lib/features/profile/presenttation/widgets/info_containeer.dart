import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onTap;

  const InfoContainer({
    super.key,
    this.icon,
    required this.text,
    this.onTap,
  });

  bool _isNumber(String value) {
    return RegExp(r'^[0-9+]+$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade50,
        ),
        child: Row(
          textDirection: Directionality.of(context), // important for RTL
          children: [
            Icon(icon, color: Colors.grey),

            const SizedBox(width: 10),

            Expanded(
              child: Directionality(
                // keep phone/email numbers correct in RTL
                textDirection:
                _isNumber(text) ? TextDirection.ltr : TextDirection.rtl,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: isRTL ? TextAlign.right : TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}