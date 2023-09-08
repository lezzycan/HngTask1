import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_task_1/src/constants/colors.dart';

Future<void> startLoading(BuildContext context,
    [String message = "Please wait...", bool? isdismissed]) async {
  FocusScope.of(context).requestFocus(FocusNode());
  EasyLoading.show(
      dismissOnTap: true, status: message, maskType: EasyLoadingMaskType.black);
}

// void updateLoading(BuildContext context, String message) {
//   _progressDialog.update(message: message);
// }

loadingSuccessful(String? message,
    [bool showDialog = false,
    BuildContext? context,
    bool gotoDashBoard = true,
    Function? listener]) {
  EasyLoading.dismiss().then((value) {
    if (message != null) {
      if (showDialog) {
        loadingdialogue(context!);
      } else
        toastSuccess(message);
    }
  });
}

void toastSuccess(String message) {
  Fluttertoast.showToast(
      msg: message == null ? '' : message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45
    ..radius = 10
    ..progressColor = AppColors.colorPrimary
    ..backgroundColor = Colors.transparent
    ..indicatorColor = AppColors.colorPrimary
    ..textColor = AppColors.colorPrimary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

Future<void> showCustomDialog(BuildContext context,
    {required Widget customView, bool barrierDismissible = true}) async {
  return await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return customView;
    },
  );
}

loadingdialogue(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Thanks for checking my profile'),
          content: Text('Let collaborate to together to build more project'),
        );
      });
}

//    oadingSuccessful(String? message,
//     [bool showDialog = false,
//     BuildContext? context,
//     bool gotoDashBoard = true,
//     Function? listener]) {
//   EasyLoading.dismiss().then((value) {
//     if (message != null) {
//       if (showDialog)
//         showMessageWithDialog(message, context!, gotoDashBoard, listener);
//       else
//         toastSuccess(message);
//     }
//   });
// }
void showMessageWithDialogWithCancel(String message, BuildContext context,
    [VoidCallback? okayListener,
    VoidCallback? cancelListener,
    String? title,
    TextStyle? style]) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title ?? "Confirm",
            style: style,
          ),
          content: Text(
            message,
            style: style,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                cancelListener?.call();
              },
              child: Text(
                "Cancel",
                style: style,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                okayListener?.call();
              },
              child: Text(
                "Yes",
                style: style,
              ),
            )
          ],
        );
      });
}

promptWarning(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.red,
              ),
              VerticalDivider(),
              Text(
                "Cancel Process",
                style: GoogleFonts.lato(
                    color: Colors.red,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          content: Text("Are you sure you want to go back",
              style: GoogleFonts.lato(
                  color: AppColors.colorPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: GoogleFonts.lato(
                      color: Colors.red,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: Text("Yes",
                  style: GoogleFonts.lato(
                      color: AppColors.colorWhite,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400)),
            )
          ],
        );
      });
}
