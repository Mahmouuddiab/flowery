import 'package:flower_app/core/theme/theme_cubit.dart';
import 'package:flower_app/core/utils/app_colors.dart';
import 'package:flower_app/core/utils/app_sizes.dart';
import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';
import 'package:flower_app/features/profile/presenttation/widgets/info_containeer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserProfileEntity user;

  ProfileInfoCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    bool isMale = user.gender.toLowerCase() == "male";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s5),
      child: Column(
        children: [
          Gap(10),
          Column(
            spacing: 15,
            children: [
              Gap(10),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: InfoContainer(
                      icon: Icons.person,
                      text: user.firstName,
                    ),
                  ),
                  Expanded(
                    child: InfoContainer(
                      icon: Icons.person,
                      text: user.lastName,
                    ),
                  ),
                ],
              ),
              InfoContainer(
                icon: Icons.email,
                text: user.email,
              ),
              InfoContainer(
                icon: Icons.phone,
                text: user.phone,
              ),
              InfoContainer(
                icon: isMale ? Icons.male : Icons.female,
                text: user.gender,
              ),
            ],
          ),
          Gap(20),

          // Theme container updates text based on selected theme
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              String themeText;
              if (themeMode == ThemeMode.light) {
                themeText = "Light";
              } else if (themeMode == ThemeMode.dark) {
                themeText = "Dark";
              }
              else {
                themeText = "System";
              }

              return InfoContainer(
                text: themeText,
                icon: Icons.dark_mode,
                onTap: () => _showThemeBottomSheet(context),
              );
            },
          ),
          Spacer(),
          InfoContainer(
              icon: Icons.logout,
              text: "logout",
            onTap: () => _showLogoutDialog(context),
          )
        ],
      ),
    );
  }
}

// Private method for bottom sheet
void _showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Theme',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: Text(
                'Light Mode',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              onTap: () {
                context.read<ThemeCubit>().setLight();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              onTap: () {
                context.read<ThemeCubit>().setDark();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // logic of logout here
              Navigator.pop(context);
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}