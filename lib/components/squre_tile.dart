import 'package:flutter/material.dart';

class SuqreTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const SuqreTile({
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          imagePath,
          height: 60,
        ),
      ),
    );
  }
}
