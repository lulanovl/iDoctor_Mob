import 'package:flutter/material.dart';

class RecordSearchFilter extends StatelessWidget {
  const RecordSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        TextField(
          decoration: InputDecoration(
            hintText: 'Поиск по истории болезни',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        const SizedBox(height: 12),

        // Date range filter
      ],
    );
  }
}
