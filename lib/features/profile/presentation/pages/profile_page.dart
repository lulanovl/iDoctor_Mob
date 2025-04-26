import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/features/profile/data/models/emergency_contact_model.dart';
import 'package:his_mobile/features/profile/data/models/user_model.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_state.dart';
import 'package:his_mobile/features/profile/presentation/widgets/emergency_contact.dart';
import 'package:his_mobile/features/profile/presentation/widgets/personal_information.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _primaryNameController = TextEditingController();
  final TextEditingController _primarySurnameController =
      TextEditingController();
  final TextEditingController _primaryPatronymicController =
      TextEditingController();
  final TextEditingController _primaryPhoneNumberController =
      TextEditingController();
  final TextEditingController _secondaryNameController =
      TextEditingController();
  final TextEditingController _secondarySurnameController =
      TextEditingController();
  final TextEditingController _secondaryPatronymicController =
      TextEditingController();
  final TextEditingController _secondaryPhoneNumberController =
      TextEditingController();

  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Load user data when the page initializes
    context.read<UserInfoBloc>().add(UserInfoLoad());
  }

  void _updateControllers(User user) {
    setState(() {
      _nameController.text = user.firstName;
      _surnameController.text = user.lastName;
      _patronymicController.text = user.middleName ?? '';
      _innController.text = user.userId.toString();
      _birthDateController.text = user.dateOfBirth ?? '';
      _genderController.text = user.gender ?? '';
      _maritalStatusController.text = user.maritalStatus ?? '';
      _emailController.text = user.email;
      _phoneNumberController.text = user.phoneNumber;

      _primaryNameController.text = user.primaryEmergencyContact.firstName;
      _primarySurnameController.text = user.primaryEmergencyContact.lastName;
      _primaryPatronymicController.text =
          user.primaryEmergencyContact.middleName ?? '';
      _primaryPhoneNumberController.text =
          user.primaryEmergencyContact.phoneNumber;

      if (user.secondaryEmergencyContact != null) {
        _secondaryNameController.text =
            user.secondaryEmergencyContact!.firstName;
        _secondarySurnameController.text =
            user.secondaryEmergencyContact!.lastName;
        _secondaryPatronymicController.text =
            user.secondaryEmergencyContact!.middleName ?? '';
        _secondaryPhoneNumberController.text =
            user.secondaryEmergencyContact!.phoneNumber;
      }
    });
  }

  void _submitUpdate() {
    if (_formKey.currentState?.validate() ?? false) {
      final currentState = context.read<UserInfoBloc>().state;
      if (currentState is UserInfoLoaded) {
        final currentUser = currentState.user;

        final updatedUser = currentUser.copyWith(
          firstName: _nameController.text,
          lastName: _surnameController.text,
          middleName: _patronymicController.text.isNotEmpty
              ? _patronymicController.text
              : null,
          dateOfBirth: _birthDateController.text.isNotEmpty
              ? _birthDateController.text
              : null,
          gender:
              _genderController.text.isNotEmpty ? _genderController.text : null,
          maritalStatus: _maritalStatusController.text.isNotEmpty
              ? _maritalStatusController.text
              : null,
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          primaryEmergencyContact: currentUser.primaryEmergencyContact.copyWith(
            firstName: _primaryNameController.text,
            lastName: _primarySurnameController.text,
            middleName: _primaryPatronymicController.text.isNotEmpty
                ? _primaryPatronymicController.text
                : null,
            phoneNumber: _primaryPhoneNumberController.text,
          ),
          secondaryEmergencyContact: _secondaryNameController.text.isNotEmpty
              ? (currentUser.secondaryEmergencyContact?.copyWith(
                    firstName: _secondaryNameController.text,
                    lastName: _secondarySurnameController.text,
                    middleName: _secondaryPatronymicController.text.isNotEmpty
                        ? _secondaryPatronymicController.text
                        : null,
                    phoneNumber: _secondaryPhoneNumberController.text,
                  ) ??
                  EmergencyContactModel(
                    id: 0, // Will be set by backend if new contact
                    firstName: _secondaryNameController.text,
                    lastName: _secondarySurnameController.text,
                    middleName: _secondaryPatronymicController.text.isNotEmpty
                        ? _secondaryPatronymicController.text
                        : null,
                    phoneNumber: _secondaryPhoneNumberController.text,
                  ))
              : null,
        );

        context.read<UserInfoBloc>().add(UserInfoUpdate(updatedUser));
        context.read<UserInfoBloc>().add(const ToggleUserInfoUpdate(false));
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _patronymicController.dispose();
    _innController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    _maritalStatusController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _primaryNameController.dispose();
    _primarySurnameController.dispose();
    _primaryPatronymicController.dispose();
    _primaryPhoneNumberController.dispose();
    _secondaryNameController.dispose();
    _secondarySurnameController.dispose();
    _secondaryPatronymicController.dispose();
    _secondaryPhoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<UserInfoBloc, UserInfoState>(
      listener: (context, state) {
        if (state is UserInfoError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is UserInfoLoaded) {
          _updateControllers(state.user);
          _isEditing = state.isEditing;
        } else if (state is UserInfoUpdating) {
          _isEditing = state.isUpdating;
        }
      },
      builder: (context, state) {
        if (state is UserInfoInitial || state is UserInfoLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              if (_isEditing)
                TextButton(
                  onPressed: _submitUpdate,
                  child:
                      const Text('Save', style: TextStyle(color: Colors.white)),
                ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: theme.primaryColor,
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      if (_isEditing)
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: theme.primaryColor,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt, size: 18),
                            onPressed: () {
                              // Handle image upload
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  PersonalInformation(
                    isEditing: _isEditing,
                    nameController: _nameController,
                    surnameController: _surnameController,
                    patronymicController: _patronymicController,
                    innController: _innController,
                    birthDateController: _birthDateController,
                    genderController: _genderController,
                    maritalStatusController: _maritalStatusController,
                    emailController: _emailController,
                    phoneNumberController: _phoneNumberController,
                  ),
                  const SizedBox(height: 20),
                  EmergencyContact(
                    isEditing: _isEditing,
                    primaryNameController: _primaryNameController,
                    primarySurnameController: _primarySurnameController,
                    primaryPatronymicController: _primaryPatronymicController,
                    primaryPhoneNumberController: _primaryPhoneNumberController,
                    secondaryNameController: _secondaryNameController,
                    secondarySurnameController: _secondarySurnameController,
                    secondaryPatronymicController:
                        _secondaryPatronymicController,
                    secondaryPhoneNumberController:
                        _secondaryPhoneNumberController,
                  ),
                  if (state is UserInfoUpdating && state.isUpdating)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
          floatingActionButton: _isEditing
              ? FloatingActionButton(
                  onPressed: _submitUpdate,
                  backgroundColor: theme.primaryColor,
                  child: const Icon(Icons.save, color: Colors.white),
                )
              : FloatingActionButton(
                  onPressed: () {
                    context
                        .read<UserInfoBloc>()
                        .add(ToggleUserInfoUpdate(true));
                  },
                  backgroundColor: theme.primaryColor,
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
        );
      },
    );
  }
}
