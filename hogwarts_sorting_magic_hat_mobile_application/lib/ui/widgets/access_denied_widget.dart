import 'package:flutter/material.dart';

class AccessDeniedWidget extends StatelessWidget {
  final String? imageUrl;

  const AccessDeniedWidget({
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageUrl != null
            ? Image.network(
                imageUrl ?? "",
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    "No image",
                    style: TextStyle(fontSize: 24),
                  );
                },
              )
            : const SizedBox(
                height: 250,
                child: Center(
                  child: Text(
                    "No image",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
        const SizedBox(width: 8),
        const Expanded(
          child: const Text(
            'ACCESS DENIED',
            style: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
