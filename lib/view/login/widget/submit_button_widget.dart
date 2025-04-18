import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SubmitButtonWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String label;

  const SubmitButtonWidget({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? const SpinKitCircle(color: Colors.green, size: 24)
              : Text(label),
    );
  }
}
