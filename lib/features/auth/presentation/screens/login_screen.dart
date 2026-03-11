import 'package:easy_localization/easy_localization.dart';
import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/router/app_routes.dart';
import 'package:flower_app/core/utils/app_font_styles.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flower_app/core/validators/app_validators.dart';
import 'package:flower_app/features/auth/domain/entity/login_entity.dart';
import 'package:flower_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flower_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flower_app/features/auth/presentation/widgets/remember_row.dart';
import 'package:flower_app/shared/custom_button.dart';
import 'package:flower_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool secure = true;

  bool rememberMe = false;

  var cubit = getIt<AuthCubit>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
      bloc: cubit,
      listener: (context, state) {
        if(state is LoginLoadingState){
          EasyLoading.show();
        }
        if(state is LoginSuccessState){
          EasyLoading.showSuccess("login successfully");
          Navigator.pushReplacementNamed(context, AppRoutes.root);
        }
        if(state is LoginErrorState){
          EasyLoading.showError(state.error);
        }

      },
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        AppImages.logo,
                        width: 50,
                        height: 40,
                      ),
                    ),

                    const Gap(90),

                    Text(
                      AppStrings.login,
                      style: AppFontStyles.w500_18,
                    ),

                    const Gap(35),

                    /// Email
                    CustomTextField(
                      label: AppStrings.email.tr(),
                      controller: emailController,
                      validator: (_) =>
                          AppValidators.emailValidator(emailController.text),
                      obscureText: false,
                      suffixIcon: const Icon(Icons.email),
                    ),

                    const Gap(35),

                    /// Password
                    CustomTextField(
                      label: AppStrings.password.tr(),
                      obscureText: secure,
                      controller: passwordController,
                      validator: (_) => AppValidators.passwordValidator(
                        passwordController.text,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secure = !secure;
                          });
                        },
                        icon: Icon(
                          secure
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),

                    const Gap(35),

                    /// Remember Row
                    RememberMeRow(
                      value: rememberMe,
                      onChanged: (val) {
                        setState(() {
                          rememberMe = val ?? false;
                        });
                      },
                      onForgotPassword: () {

                      },
                    ),

                    const Gap(70),

                    /// Login Button
                    CustomButton(
                      text: AppStrings.login.tr(),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                            LoginEntity(email: emailController.text, password:passwordController.text)
                          );
                        }
                      },
                    ),

                    const Gap(20),

                    /// Register Navigation
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.doNot.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.register,
                            );
                          },
                          child: Text(
                            AppStrings.register.tr(),
                            style:
                            Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}