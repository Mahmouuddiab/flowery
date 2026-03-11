import 'dart:convert';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/cache/cache_helper.dart';
import 'package:flower_app/core/router/app_routes.dart';
import 'package:flower_app/core/theme/theme_cubit.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flower_app/features/profile/domain/entity/user_profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileInfoCard extends StatefulWidget {
  final UserProfileEntity user;

  const ProfileInfoCard({super.key, required this.user});

  @override
  State<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends State<ProfileInfoCard> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }


  /// Pick image from gallery
  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        setState(() => _image = file);

        // Save to SharedPreferences
        final bytes = await file.readAsBytes();
        final base64Str = base64Encode(bytes);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('saved_image', base64Str);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  /// Load saved image from SharedPreferences
  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64Str = prefs.getString('saved_image');
    if (base64Str != null) {
      final bytes = base64Decode(base64Str);
      final file = File('${Directory.systemTemp.path}/saved_image.png');
      await file.writeAsBytes(bytes);
      setState(() => _image = file);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMale = widget.user.gender.toLowerCase() == "male";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          /// PROFILE HEADER
          GestureDetector(
            onTap: _pickImage, // only gallery
            child: Center(
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey.shade200,
                child: _image != null
                    ? ClipOval(
                  child: Image.file(
                    _image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
                    : const Icon(Icons.photo, size: 50),
              ),
            ),
          ),
          Gap(25),
          Text(
            "${widget.user.firstName} ${widget.user.lastName}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(widget.user.email),
           Gap(30),
          /// USER INFO CARD
          _buildSectionCard(
            children: [
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(widget.user.phone),
              ),
              ListTile(
                leading: Icon(isMale ? Icons.male : Icons.female),
                title: Text(widget.user.gender),
              ),
            ],
          ),

          const Gap(30),

          /// SETTINGS CARD
          _buildSectionCard(
            children: [
              BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  String themeText;
                  if (themeMode == ThemeMode.light) {
                    themeText = "Light";
                  } else if (themeMode == ThemeMode.dark) {
                    themeText = "Dark";
                  } else {
                    themeText = "System";
                  }
                  return ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: Text(themeText),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _showThemeBottomSheet(context),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text("language".tr()),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _showLanguageModal(context),
              ),
            ],
          ),

          const Gap(100),

          /// LOGOUT BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              icon: const Icon(Icons.logout),
              label: Text("logout".tr()),
              onPressed: () => _showLogoutDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}

/// SECTION CARD WIDGET
Widget _buildSectionCard({required List<Widget> children}) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(children: children),
  );
}

/// THEME MODAL
void _showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose Theme",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text("Light Mode"),
              onTap: () {
                context.read<ThemeCubit>().setLight();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
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

/// LANGUAGE MODAL
void _showLanguageModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "select language".tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Text("🇬🇧", style: TextStyle(fontSize: 22)),
              title: const Text("English"),
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Text("🇸🇦", style: TextStyle(fontSize: 22)),
              title: const Text("العربية"),
              onTap: () {
                context.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

/// LOGOUT DIALOG
void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppStrings.logout.tr()),
        content: Text("are you sure you want to logout ?").tr(),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel".tr()),
          ),
          TextButton(
            onPressed: () {
              _performLogout(context);
              Navigator.pop(context);
            },
            child: Text(
              AppStrings.logout.tr(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

/// LOGOUT FUNCTION
void _performLogout(BuildContext context) async {
  await CacheHelper.clearToken();
  Navigator.pushReplacementNamed(context, AppRoutes.login);
}