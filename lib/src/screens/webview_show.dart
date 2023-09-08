import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_task_1/src/constants/app_strings.dart';
import 'package:hng_task_1/src/constants/colors.dart';
import 'package:hng_task_1/src/services/indicators.dart';

import 'package:webview_flutter/webview_flutter.dart';

class GithubWebLoader extends StatefulWidget {
  String title;
  String url;
  GithubWebLoader(this.title, this.url);

  @override
  _WebLoaderActivity createState() => _WebLoaderActivity();
}

class _WebLoaderActivity extends State<GithubWebLoader> {
  

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle styleAppbar = GoogleFonts.lato(
    color: AppColors.colorPrimary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        leading: GestureDetector(
          onTap: () {
           promptWarning(context);
          },
          child:Platform.isIOS ? const Icon(Icons.arrow_back_ios) : Icon(
            Icons.keyboard_backspace,
            size: 32.h,
            color: AppColors.colorPrimary,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.colorPrimary),
        title: Text(widget.title, style: styleAppbar),
        elevation: 0.0,
      ),
      body: WebView(
        debuggingEnabled: true,
        
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController tmp) async {
          await tmp.loadUrl(widget.url);
        },
        onPageStarted: (str) async {
          await startLoading(context);
         
        },
        navigationDelegate: (nav) {
         
          if (nav.url.contains(AppString.githubUrl)) {}
          return NavigationDecision.navigate;
        },
        onPageFinished: (str) => loadingSuccessful(null),
        onWebResourceError: (error) => loadingSuccessful(null),),
    );
  }
}
