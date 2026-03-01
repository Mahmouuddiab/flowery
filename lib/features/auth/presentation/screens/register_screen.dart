import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/router/app_routes.dart';
import 'package:flower_app/core/utils/app_font_styles.dart';
import 'package:flower_app/core/utils/app_images.dart';
import 'package:flower_app/core/utils/app_strings.dart';
import 'package:flower_app/core/validators/app_validators.dart';
import 'package:flower_app/features/auth/domain/entity/register_entity.dart';
import 'package:flower_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flower_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:flower_app/features/auth/presentation/widgets/gender_dropdown.dart';
import 'package:flower_app/shared/custom_button.dart';
import 'package:flower_app/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController firstController = TextEditingController();

  TextEditingController lastController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool secure = true;

  bool secure2 = true;

  String? gender;

  var authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
        bloc: authCubit,
        listener: (context, state) {
          if(state is RegisterLoadingState){
            EasyLoading.show();
          }
          if(state is RegisterSuccessState){
            EasyLoading.showSuccess("Sign up successfully");
          }
          if(state is RegisterErrorState){
            EasyLoading.showError(state.error);
          }

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
                    child: SvgPicture.asset(AppImages.logo, width: 50, height: 40),
                  ),
                  Gap(50),
                  Text(AppStrings.create,style: AppFontStyles.w500_18,),
                  Gap(35),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: "First ${AppStrings.name}",
                          obscureText: false,
                          controller: firstController,
                          validator: (_) => AppValidators.displayNameValidator(
                            firstController.text,
                          ),
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: "Last ${AppStrings.name}",
                          obscureText: false,
                          controller: lastController,
                          validator: (_) => AppValidators.displayNameValidator(
                            lastController.text,
                          ),
                          suffixIcon: Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                  Gap(35),
                  CustomTextField(
                    label: AppStrings.email,
                    controller: emailController,
                    validator: (_) =>
                        AppValidators.emailValidator(emailController.text),
                    obscureText: false,
                    suffixIcon: Icon(Icons.email),
                  ),
                  Gap(35),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: AppStrings.password,
                          obscureText: secure,
                          controller: passwordController,
                          validator: (_) => AppValidators.passwordValidator(
                            passwordController.text,
                          ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  secure = !secure;
                                });
                              },
                              icon: Icon(secure? Icons.visibility_off:Icons.visibility)
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: "Confirm ${AppStrings.password}",
                          obscureText: secure2,
                          controller: confirmPasswordController,
                          validator: (_) => AppValidators.repeatPasswordValidator(
                            value: confirmPasswordController.text,
                            password: passwordController.text,
                          ),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  secure2 = !secure2;
                                });
                              },
                              icon: Icon(secure2? Icons.visibility_off:Icons.visibility)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(35),
                  CustomTextField(
                    label: AppStrings.phone,
                    controller: phoneController,
                    // validator: (_) =>
                    //     AppValidators.phoneValidator(phoneController.text, context),
                    obscureText: false,
                    suffixIcon: Icon(Icons.phone),
                  ),
                  Gap(35),
                  GenderDropdown(
                      selectedGender: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                  ),
                  Gap(70),
                  CustomButton(
                      text: AppStrings.register,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          authCubit.register(
                            RegisterEntity(
                                firstName: firstController.text,
                                lastName: lastController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                rePassword: confirmPasswordController.text,
                                phone: phoneController.text,
                                gender: gender!
                            )
                          );
                        }
                      }
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Text(AppStrings.already,style:Theme.of(context).textTheme.titleMedium),
                      GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, AppRoutes.login);
                          },
                          child: Text(AppStrings.login,style:Theme.of(context).textTheme.titleSmall,)
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
