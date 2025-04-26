import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';

class BookingFilter extends StatefulWidget {
  const BookingFilter({super.key});

  @override
  State<BookingFilter> createState() => _BookingFilterState();
}

class _BookingFilterState extends State<BookingFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search bar
        TextField(
          decoration: InputDecoration(
            hintText: 'Поиск врача',
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
      ],
    );
  }
}
