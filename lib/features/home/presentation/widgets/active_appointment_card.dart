import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:intl/intl.dart';

class ActiveAppointmentCard extends StatelessWidget {
  const ActiveAppointmentCard({super.key});

  void _showQueueDialog(BuildContext context) {
    // Mock queue data
    final queueList = [
      {'ticketNumber': 'A101', 'status': 'На приеме', 'isCurrent': false},
      {'ticketNumber': 'A102', 'status': 'Ожидает', 'isCurrent': false},
      {
        'ticketNumber': 'A103',
        'status': 'Ожидает',
        'isCurrent': true
      }, // User's ticket
      {'ticketNumber': 'A104', 'status': 'Ожидает', 'isCurrent': false},
      {'ticketNumber': 'A105', 'status': 'Ожидает', 'isCurrent': false},
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Очередь на прием'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: queueList.length,
              itemBuilder: (context, index) {
                final item = queueList[index];
                return Card(
                  color: item['isCurrent'] as bool
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : null,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: item['isCurrent'] as bool
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                      child: Text(
                        item['ticketNumber'].toString().substring(1),
                        style: TextStyle(
                          color: item['isCurrent'] as bool
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    title: Text('Талон ${item['ticketNumber']}'),
                    subtitle: Text(item['status'].toString()),
                    trailing: item['isCurrent'] as bool
                        ? const Icon(Icons.person, color: Colors.blue)
                        : null,
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mock appointment data
    final appointment = {
      'doctorName': 'Иванов Иван Иванович',
      'specialty': 'Терапевт',
      'date': DateTime(2025, 4, 28, 14, 30),
      'location': 'Клиника на Ленина, кабинет 204',
      'ticketNumber': 'A103',
      'positionInQueue': 3,
    };

    final dateFormat = DateFormat('dd MMMM, HH:mm');

    return GestureDetector(
      onTap: () => _showQueueDialog(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Colored header section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'Запись на прием',
                    style: context.textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text(
                    'Талон: ${appointment['ticketNumber']}',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Details section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Doctor avatar
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child:
                        const Icon(Icons.person, size: 36, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),

                  // Appointment details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['doctorName'].toString(),
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          appointment['specialty'].toString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text(
                              dateFormat
                                  .format(appointment['date'] as DateTime),
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                appointment['location'].toString(),
                                style: context.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.people,
                                size: 16, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text(
                              'Ваша позиция в очереди: ${appointment['positionInQueue']}',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
