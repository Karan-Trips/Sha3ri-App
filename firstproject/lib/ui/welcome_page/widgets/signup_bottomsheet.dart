import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../../values/export.dart';
import '../../auth/login/ui/forget_Password/reset_password.dart';

class SignupBottomsheet extends StatefulWidget {
  @override
  State<SignupBottomsheet> createState() => _SignupBottomsheetState();
}

class _SignupBottomsheetState extends State<SignupBottomsheet> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('IN');
  late FocusNode mobileNode;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = false;
  bool isChecked = false;
  late TextEditingController mobileController;
  late TextEditingController email;
  late TextEditingController newPass;
  late TextEditingController confPass;

  @override
  void initState() {
    super.initState();
    mobileNode = FocusNode();
    mobileController = TextEditingController();
    email = TextEditingController();
    newPass = TextEditingController();
    confPass = TextEditingController();
  }

  @override
  void dispose() {
    mobileNode.dispose();
    mobileController.dispose();
    email.dispose();
    newPass.dispose();
    confPass.dispose();
    super.dispose();
  }

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24.0,
            right: 24.0,
            top: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Join Us',
                style: TextStyle(
                    fontFamily: 'figtree_black',
                    fontSize: 48.spMin,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ).wrapPaddingBottom(20.h),
              Text(
                'Sign up today & enjoy our platform',
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColor.white : AppColor.black,
                ),
                textAlign: TextAlign.center,
              ).wrapPaddingHorizontal(43.w),
              SizedBox(height: 20.h),
              AppTextField(
                label: 'Email',
                hint: 'Email',
                validators: emailValidator,
                height: 55.h,
                keyboardAction: TextInputAction.next,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                contentPadding: EdgeInsets.only(left: 20.w),
              ),
              SizedBox(height: 20.h),
              AppTextField(
                controller: mobileController,
                label: S.current.mobNumber,
                hint: '000-000-0000',
                keyboardType: TextInputType.phone,
                validators: mobileValidator,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(10),
                ],
                focusNode: mobileNode,
                prefixIcon: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async => {
                            Future.delayed(Duration.zero, () {
                              mobileNode.unfocus();
                              mobileNode.canRequestFocus = false;
                            }),
                            await _openCountryPickerDialog(),
                            mobileNode.canRequestFocus = true,
                          },
                          child: Row(
                            children: [
                              Text(
                                '+${_selectedDialogCountry.phoneCode}',
                                style: textMedium.copyWith(
                                  fontSize: 17.spMin,
                                ),
                              ).wrapPaddingOnly(left: 15.w),
                              5.0.horizontalSpace,
                              Image.asset(
                                Assets.imageArrowDown,
                                color: AppColor.osloGray,
                                height: 8.0,
                                width: 8.0,
                              ).wrapPaddingRight(5.w),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              AppTextField(
                validators: passwordValidator,
                label: 'Password',
                hint: 'Password',
                height: 55.h,
                keyboardAction: TextInputAction.next,
                controller: email,
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText
                        ? Icons.visibility_off
                        : Icons.visibility)),
                keyboardType: TextInputType.emailAddress,
                contentPadding: EdgeInsets.only(left: 20.w),
              ),
              SizedBox(height: 15.h),
              AppTextField(
                validators: passwordValidator,
                label: 'Confirm Password',
                hint: 'Confirm Password',
                height: 55.h,
                keyboardAction: TextInputAction.done,
                controller: email,
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    child: Icon(_obscureText2
                        ? Icons.visibility_off
                        : Icons.visibility)),
                keyboardType: TextInputType.emailAddress,
                contentPadding: EdgeInsets.only(left: 20.w),
              ),
              CheckboxListTile.adaptive(
                  value: isChecked,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColor.blue,
                  checkboxShape: CircleBorder(),
                  checkColor: AppColor.white,
                  title: RichText(
                      softWrap: true,
                      text: TextSpan(
                          text:
                              'By continuing, you are agreeing to our company\'s',
                          style: TextStyle(
                              color:
                                  isDarkMode ? AppColor.white : AppColor.black),
                          children: [
                            TextSpan(
                                text: ' Terms of Service',
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                    color: isDarkMode
                                        ? AppColor.white
                                        : AppColor.black)),
                            TextSpan(
                                text: 'Privacy policy.',
                                style: TextStyle(color: Colors.blue)),
                          ])),
                  onChanged: (val) {
                    setState(() {
                      isChecked = val!;
                    });
                  }).wrapPaddingVertical(10.r),
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ResetPasswordScreenPage(login: true)));
                  // } else {
                  //   showMessage('Please enter valid data');
                  // }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                  backgroundColor: AppColor.blue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  'Log In',
                  style: textBold.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(
                        color: isDarkMode ? AppColor.white : AppColor.black,
                        fontSize: 14.0),
                    children: [
                      TextSpan(
                        text: "Create an Account",
                        style: TextStyle(color: Colors.blue, fontSize: 14.0),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  Future _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.lightBlueAccent,
          searchInputDecoration: InputDecoration(hintText: S.current.search),
          isSearchable: true,
          title: Text(S.current.selectYourPhoneCode),
          onValuePicked: (Country country) =>
              setState(() => _selectedDialogCountry = country),
          itemBuilder: _buildDialogItem,
          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('US'),
            CountryPickerUtils.getCountryByIsoCode('IN'),
          ],
        ),
      );
}
