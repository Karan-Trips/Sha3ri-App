import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../auth/login/ui/forget_Password/forget_screen.dart';
import '../../../values/export.dart';

class LoginBottomSheet extends StatefulWidget {
  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('IN');
  late FocusNode mobileNode;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  late TextEditingController mobileController;

  @override
  void initState() {
    super.initState();
    mobileNode = FocusNode();
    mobileController = TextEditingController();
  }

  @override
  void dispose() {
    mobileNode.dispose();
    mobileController.dispose();
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

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24.0,
        right: 24.0,
        top: 24.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hey !',
              style: TextStyle(
                fontFamily: 'appFont',
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Please Login to continue.',
              style: TextStyle(
                fontSize: 16.0,
                color: isDarkMode ? Colors.white70 : Colors.black,
              ),
              textAlign: TextAlign.center,
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
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ).wrapPaddingOnly(left: 15.w),
                            5.0.horizontalSpace,
                            Image.asset(
                              Assets.imageArrowDown,
                              color: isDarkMode
                                  ? Colors.white70
                                  : AppColor.osloGray,
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
            SizedBox(height: 20),
            TextFormField(
              obscureText: _obscureText,
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  letterSpacing: 15,
                  color: isDarkMode ? Colors.white70 : AppColor.osloGray,
                  fontWeight: FontWeight.bold,
                ),
                hintText: '••••••••',
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: isDarkMode ? Colors.white70 : Colors.black45,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: isDarkMode ? Colors.white70 : Colors.black45,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetScreenPage()));
                },
                child: Text('Forgot Password?'),
              ),
            ),
            AppButton(buttonColor: true, 'Login', () {
              locator<AppRouter>().pushAndPopUntil(HomeRouteMain(),
                  predicate: (route) => false);
            }),
            SizedBox(height: 20),
            Divider(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black,
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                      text: "Create an Account",
                      style: TextStyle(
                        color: isDarkMode ? Colors.blue[300] : Colors.blue,
                        fontSize: 14.0,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
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
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ],
      );

  Future _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.lightBlueAccent,
          searchInputDecoration: InputDecoration(hintText: S.current.search),
          isSearchable: true,
          title: Text(
            S.current.selectYourPhoneCode,
            style: TextStyle(
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
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
