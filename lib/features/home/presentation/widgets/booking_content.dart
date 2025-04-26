import 'package:flutter/material.dart';
import 'package:his_mobile/core/widgets/layout/app_top_bar.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/features/home/presentation/widgets/active_appointment_card.dart';
import 'package:his_mobile/features/home/presentation/widgets/booking_filter.dart';
import 'package:his_mobile/features/home/presentation/widgets/doctor_list.dart';

class BookingContent extends StatelessWidget {
  const BookingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final hasActiveAppointment = true;

    return ListView(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      children: [
        const AppTopBar(title: 'Запись на прием'),
        const SizedBox(height: 16),
        if (hasActiveAppointment) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Ваша ближайшая запись',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ActiveAppointmentCard(),
          ),
          const SizedBox(height: 24),
        ],
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: BookingFilter(),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Доступные специалисты',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DoctorList(),
        ),
      ],
    );
  }
}
