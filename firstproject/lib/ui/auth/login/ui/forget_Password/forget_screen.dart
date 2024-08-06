import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widget/app_text_filed.dart';
import 'reset_password.dart';

class ForgetScreenPage extends StatefulWidget {
  const ForgetScreenPage({super.key});

  @override
  State<ForgetScreenPage> createState() => _ForgetScreenPageState();
}

class _ForgetScreenPageState extends State<ForgetScreenPage> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('IN');
  late TextEditingController mobileController;
  late FocusNode mobileNode;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColor.black : AppColor.white;
    final textColor = isDarkMode ? AppColor.white : Colors.black;
    final hintColor = isDarkMode ? AppColor.black : AppColor.osloGray;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: BackButton(color: textColor),
        title: Text(
          "Forgot Password",
          style: w600_16.copyWith(color: textColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "Please enter your email address to reset your password.",
            softWrap: true,
            style: w600_20.copyWith(color: textColor),
          ).wrapPaddingSymmetric(horizontal: 24.w, vertical: 40.h),
          Form(
            key: _formKey,
            child: AppTextField(
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
                                color: textColor,
                              ),
                            ).wrapPaddingOnly(left: 15.w),
                            5.0.horizontalSpace,
                            Image.asset(
                              Assets.imageArrowDown,
                              color: hintColor,
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
            ).wrapPaddingHorizontal(17.w),
          ),
          Spacer(),
          AppButton(
            'Submit',
            () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreenPage()));
              }
            },
            buttonColor: true,
          ).wrapPaddingSymmetric(horizontal: 17.w, vertical: 26.h)
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text(
            "+${country.phoneCode}",
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color),
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
          itemFilter: (c) => ['IN', 'CN'].contains(c.isoCode),
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
