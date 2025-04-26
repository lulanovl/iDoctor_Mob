import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/core/extensions/context_extension.dart';
import 'package:his_mobile/core/data/datasources/locally/user_data.dart';
import 'package:his_mobile/features/home/application.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_bloc.dart';
import 'package:his_mobile/features/profile/presentation/user_info_bloc/user_info_event.dart';
import 'package:his_mobile/core/widgets/buttons/app_button.dart';
import 'package:his_mobile/core/widgets/buttons/app_text_button.dart';
import 'package:his_mobile/core/widgets/buttons/change_language_button.dart';

@RoutePage()
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildDrawerHeader(context),
          const Divider(height: 1),
          const ChangeLanguageButton(),
          const SizedBox(height: 10),
          Expanded(child: _buildDrawerButtons(context)),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    final user = sl<UserData>().getUser();

    final name =
        user != null ? '${user.firstName} ${user.lastName}' : 'Guest User';
    final email = user?.email ?? '';

    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: kToolbarHeight),
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerButtons(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        AppTextButton(
          title: context.l10n.personal_information,
          icon: Icons.person,
          onPressed: () {
            context.read<UserInfoBloc>().add(UserInfoLoad());
            context.router.pushNamed('/profile');
          },
        ),
        AppTextButton(
          title: context.l10n.medical_data,
          icon: Icons.medical_information_outlined,
          onPressed: () => context.router.pushNamed('/medical-data'),
        ),
        AppTextButton(
          title: context.l10n.insurance,
          icon: Icons.safety_check,
          onPressed: () {},
        ),
        AppTextButton(
          title: context.l10n.change_password,
          icon: Icons.lock,
          onPressed: () => context.router.pushNamed('/change-password'),
        ),
        AppTextButton(
          title: context.l10n.settings,
          icon: Icons.settings,
          onPressed: () => context.router.pushNamed('/settings'),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppButton(
        title: context.l10n.logout,
        onPressed: () {
          // TODO: Replace with actual logout logic
          HisMobile.of(context).setLocale(const Locale('ru'));
        },
      ),
    );
  }
}
