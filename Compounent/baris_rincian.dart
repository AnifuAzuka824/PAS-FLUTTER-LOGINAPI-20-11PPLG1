import 'package:flutter/material.dart';

class RincianRow extends StatelessWidget {
  final String label;
  final String value;
  final bool tebal;

  const RincianRow({
    super.key,
    required this.label,
    required this.value,
    this.tebal = false,
  });

  FontWeight _berat() {
    if (tebal) {
      return FontWeight.bold;
    }
    return FontWeight.w500;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF6B6259)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                fontWeight: _berat(),
                color: const Color(0xFF1F1B16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
