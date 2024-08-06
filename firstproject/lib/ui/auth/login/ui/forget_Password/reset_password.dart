import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/ui/auth/sign_up/sign_up_page.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'reset_pass.dart';

@RoutePage()
class ResetPasswordScreenPage extends StatefulWidget {
  const ResetPasswordScreenPage({super.key, this.login = false});
  final bool login;

  @override
  State<ResetPasswordScreenPage> createState() =>
      _ResetPasswordScreenPageState();
}

class _ResetPasswordScreenPageState extends State<ResetPasswordScreenPage> {
  int _secondsRemaining = 50;
  late Timer _timer;
  bool _showResendButton = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _showResendButton = false;
    _secondsRemaining = 50;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _showResendButton = true;
        }
      });
    });
  }

  void _resendCode() {
    _startTimer();
  }

  int code = 0;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? AppColor.black : AppColor.white;
    final textColor = isDarkMode ? AppColor.white : AppColor.black;
    final hintColor = isDarkMode ? AppColor.black : AppColor.osloGray;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: textColor,
              )),
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text(
            "Verification",
            style: w600_16.copyWith(color: textColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            40.verticalSpace,
            Text(
              'Please enter 4-digit code',
              style: w600_20.copyWith(color: textColor),
            ).wrapPaddingBottom(10.h),
            Text(
              textAlign: TextAlign.center,
              "We sent you 4-digit verification code to you at",
              style: TextStyle(color: textColor),
            ).wrapPaddingBottom(5.h),
            TextButton(
              onPressed: () {},
              child: Text(
                "+1-123-456-7890",
                style: TextStyle(color: AppColor.blue),
              ),
            ).wrapPaddingBottom(10.h),
            OtpTextField(
              numberOfFields: 4,
              fieldHeight: 55.h,
              clearText: true,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: textColor),
              fieldWidth: 60.w,
              borderWidth: 0,
              hasCustomInputDecoration: true,
              decoration: InputDecoration(
                  isDense: true,
                  focusColor: AppColor.blue,
                  alignLabelWithHint: true,
                  hintText: "•",
                  hintStyle: TextStyle(color: hintColor),
                  filled: true,
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  fillColor: backgroundColor,
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(10.r))),
              keyboardType: TextInputType.number,
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(50),
              onCodeChanged: (String code) {
                debugPrint(code);
              },
              onSubmit: (String verificationCode) {
                code = int.parse(verificationCode);
                debugPrint(verificationCode);
              },
            ).wrapPaddingBottom(25.h),
            _showResendButton
                ? TextButton(
                    onPressed: _resendCode,
                    child: Text(
                      "Resend Code",
                      style: TextStyle(color: AppColor.blue),
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Didn't receive code? ",
                            style: w500_14.copyWith(color: textColor)),
                        TextSpan(
                          text:
                              "0:${_secondsRemaining.toString().padLeft(2, '0')}",
                          style: w500_14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
            Spacer(),
            AppButton('Verify', () {
              widget.login
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CompelteProfilePage()))
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ResetPasswordPage()));
            }, buttonColor: true)
                .wrapPaddingSymmetric(vertical: 26.h)
          ],
        ).wrapPaddingHorizontal(34.w),
      ),
    );
  }
}
