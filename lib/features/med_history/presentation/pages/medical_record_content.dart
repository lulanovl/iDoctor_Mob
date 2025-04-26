import 'package:flutter/material.dart';
import 'package:his_mobile/core/widgets/layout/app_top_bar.dart';
import 'package:his_mobile/features/med_history/presentation/widgets/medical_record_list.dart';
import 'package:his_mobile/features/med_history/presentation/widgets/record_category_tabs.dart';
import 'package:his_mobile/features/med_history/presentation/widgets/record_search_filter.dart';

class MedicalRecordContent extends StatefulWidget {
  const MedicalRecordContent({super.key});

  @override
  State<MedicalRecordContent> createState() => _MedicalRecordContentState();
}

class _MedicalRecordContentState extends State<MedicalRecordContent> {
  int _selectedTabIndex = 0;
  final List<String> _tabTitles = [
    'Все',
    'Диагнозы',
    'Рецепты',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kToolbarHeight),
        const AppTopBar(title: 'История болезни'),
        const SizedBox(height: 16),

        // Search and filter section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: RecordSearchFilter(),
        ),
        const SizedBox(height: 16),

        // Category tabs
        RecordCategoryTabs(
          titles: _tabTitles,
          selectedIndex: _selectedTabIndex,
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        const SizedBox(height: 16),

        // Medical records list - takes remaining space
        Expanded(
          child: MedicalRecordList(
            category: _tabTitles[_selectedTabIndex],
          ),
        ),
      ],
    );
  }
}
