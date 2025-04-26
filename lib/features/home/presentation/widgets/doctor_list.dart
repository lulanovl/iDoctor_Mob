import 'package:flutter/material.dart';
import 'package:his_mobile/features/home/presentation/widgets/doctor_card.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'id': '1',
        'name': 'Иванов Иван Иванович',
        'specialty': 'Терапевт',
        'experience': '15 лет',
        'rating': 4.8,
        'reviewCount': 124,
        'availableSlots': ['10:00', '11:30', '15:00'],
        'price': '1500₽',
      },
      {
        'id': '2',
        'name': 'Петрова Елена Сергеевна',
        'specialty': 'Кардиолог',
        'experience': '10 лет',
        'rating': 4.6,
        'reviewCount': 98,
        'availableSlots': ['09:30', '14:00'],
        'price': '2000₽',
      },
      {
        'id': '3',
        'name': 'Смирнов Алексей Петрович',
        'specialty': 'Невролог',
        'experience': '20 лет',
        'rating': 4.9,
        'reviewCount': 156,
        'availableSlots': ['12:00', '16:30', '18:00'],
        'price': '2200₽',
      },
      {
        'id': '4',
        'name': 'Козлова Марина Александровна',
        'specialty': 'Офтальмолог',
        'experience': '8 лет',
        'rating': 4.5,
        'reviewCount': 87,
        'availableSlots': ['10:30', '13:00', '17:30'],
        'price': '1800₽',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: doctors.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(doctor: doctor);
      },
    );
  }
}
