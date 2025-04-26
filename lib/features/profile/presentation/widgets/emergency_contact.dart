import 'package:flutter/material.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/widgets/forms/drop_down_field.dart';
import 'package:his_mobile/core/widgets/forms/editable_field.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({
    super.key,
    required this.primaryNameController,
    required this.primarySurnameController,
    required this.primaryPatronymicController,
    required this.primaryPhoneNumberController,
    required this.secondaryNameController,
    required this.secondarySurnameController,
    required this.secondaryPatronymicController,
    required this.secondaryPhoneNumberController,
    this.isEditing = false,
  });

  final TextEditingController primaryNameController;
  final TextEditingController primarySurnameController;
  final TextEditingController primaryPatronymicController;
  final TextEditingController primaryPhoneNumberController;
  final TextEditingController secondaryNameController;
  final TextEditingController secondarySurnameController;
  final TextEditingController secondaryPatronymicController;
  final TextEditingController secondaryPhoneNumberController;
  final bool isEditing;

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  @override
  Widget build(BuildContext context) {
    return DropDownField(
      title: context.l10n.emergency_contact,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Primary contact',
              style: context.textTheme.displayMedium,
            ),
          ),
          EditableField(
            controller: widget.primaryNameController,
            title: context.l10n.name,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.primarySurnameController,
            title: context.l10n.surname,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.primaryPatronymicController,
            title: context.l10n.patronymic,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.primaryPhoneNumberController,
            title: context.l10n.phone_number,
            isEditable: widget.isEditing,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              'Secondary contact',
              style: context.textTheme.displayMedium,
            ),
          ),
          EditableField(
            controller: widget.secondaryNameController,
            title: context.l10n.name,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.secondarySurnameController,
            title: context.l10n.surname,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.secondaryPatronymicController,
            title: context.l10n.patronymic,
            isEditable: widget.isEditing,
          ),
          EditableField(
            controller: widget.secondaryPhoneNumberController,
            title: context.l10n.phone_number,
            isEditable: widget.isEditing,
          ),
        ],
      ),
    );
  }
}
