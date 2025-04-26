import 'package:flutter/material.dart';
import 'package:his_mobile/features/med_history/presentation/widgets/medical_record_card.dart';
import 'package:intl/intl.dart';

class MedicalRecordList extends StatelessWidget {
  final String category;

  const MedicalRecordList({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // Mock data - would come from a repository or API in a real app
    final records = _getFilteredRecords(category);

    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_information_outlined,
                size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Нет записей в категории "$category"',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return MedicalRecordCard(record: records[index]);
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredRecords(String category) {
    final dateFormat = DateFormat('dd.MM.yyyy');

    final allRecords = [
      {
        'id': '1',
        'title': 'Клинический анализ крови',
        'category': 'Анализы',
        'date': dateFormat.parse('15.02.2024'),
        'doctor': 'Иванов А.П.',
        'description': '''
Гемоглобин: 145 г/л (норма: 130-160)
Эритроциты: 4.8 x 10^12/л (норма: 4.0-5.0)
Лейкоциты: 6.2 x 10^9/л (норма: 4.0-9.0)
Тромбоциты: 280 x 10^9/л (норма: 180-320)
СОЭ: 5 мм/ч (норма: 0-15)''',
        'icon': Icons.bloodtype,
        'color': Colors.red[700],
      },
      {
        'id': '2',
        'title': 'Биохимический анализ крови',
        'category': 'Анализы',
        'date': dateFormat.parse('15.02.2024'),
        'doctor': 'Иванов А.П.',
        'description': '''
Общий белок: 72 г/л (норма: 64-83)
Глюкоза: 5.1 ммоль/л (норма: 3.9-5.8)
Холестерин: 4.8 ммоль/л (норма: до 5.2)
Креатинин: 80 мкмоль/л (норма: 44-110)
АЛТ: 25 Ед/л (норма: до 41)
АСТ: 22 Ед/л (норма: до 38)''',
        'icon': Icons.science,
        'color': Colors.blue[700],
      },
      {
        'id': '3',
        'title': 'Электрокардиограмма (ЭКГ)',
        'category': 'Диагнозы',
        'date': dateFormat.parse('16.02.2024'),
        'doctor': 'Петрова М.С.',
        'description': '''
Ритм: синусовый
Частота сердечных сокращений: 72 уд/мин
Электрическая ось сердца: нормальное положение
Заключение: ЭКГ в пределах нормы''',
        'icon': Icons.monitor_heart,
        'color': Colors.pink[700],
      },
      {
        'id': '4',
        'title': 'Рецепт №2458',
        'category': 'Рецепты',
        'date': dateFormat.parse('17.02.2024'),
        'doctor': 'Петрова М.С.',
        'description': '''
1. Амоксициллин 500 мг - по 1 таблетке 3 раза в день, 7 дней
2. Парацетамол 500 мг - по 1 таблетке при температуре выше 38°C
3. Лоратадин 10 мг - по 1 таблетке 1 раз в день, 5 дней''',
        'icon': Icons.receipt_long,
        'color': Colors.green[700],
      },
      {
        'id': '5',
        'title': 'Вакцинация против гриппа',
        'category': 'Прививки',
        'date': dateFormat.parse('10.10.2023'),
        'doctor': 'Смирнова К.Л.',
        'description': '''
Препарат: Гриппол Плюс
Производитель: Петровакс
Серия: AB1234
Срок действия: 1 год''',
        'icon': Icons.vaccines,
        'color': Colors.amber[700],
      },
    ];

    if (category == 'Все') {
      return allRecords;
    }

    return allRecords
        .where((record) => record['category'] == category)
        .toList();
  }
}
