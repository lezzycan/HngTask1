import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng_task_1/src/constants/app_strings.dart';
import 'package:hng_task_1/src/constants/colors.dart';
import 'package:hng_task_1/src/screens/webview_show.dart';
import 'package:hng_task_1/src/widgets/build_profile.dart';

class MyProfileDetails extends StatelessWidget {
  MyProfileDetails({super.key});

  List<IconData> icons = [
    Icons.email,
    Icons.phone,
  ];
  List<String> text = ['Email', 'Mobile'];
  List<String> subText = [
    'waheedolalekan23@gmail.com',
    '+2349036538231',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,

      // appBar: AppBar(
      //   title:  Text('My Profile',
      //   style: GoogleFonts.lato(
      //     fontSize: 14.sp,
      //     color: AppColors.colorWhite
      //   ),
      //   ),
      //   flexibleSpace: Center(
      //     child: CircleAvatar(
      //       radius: 50.r,
      //       backgroundColor: Colors.red,
      //     ),
      //   ),
      //   backgroundColor: Colors.blue,
      //  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r))),

      // ),
      body: CustomScrollView(
        primary: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
              backgroundColor: Colors.blueGrey,
              shape: BeveledRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16.r))),
              expandedHeight: 200.h,
              //  collapsedHeight: 100.h,
              pinned: true,
              floating: false,
              primary: true,
              systemOverlayStyle:
                  const SystemUiOverlayStyle(statusBarColor: Colors.blueGrey),
              centerTitle: true,
              title: Text(
                'My Profile',
                style: GoogleFonts.lato(
                  fontSize: 14.sp,
                  color: AppColors.colorWhite,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kTextTabBarHeight),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppString.image),
                        radius: 60.r,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Waheed Olalekan',
                        style: GoogleFonts.lato(
                          fontSize: 18.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                      Text(
                        'Mobile Developer(Flutter)',
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          color: AppColors.colorWhite,
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return BuildProfile(
                  icon: icons[index],
                  text: text[index],
                  subTitle: subText[index],
                );
              }, childCount: icons.length),
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 18.h),
              sliver: SliverToBoxAdapter(
                child: Material(
                  child: MaterialButton(
                    color: Colors.brown,
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => GithubWebLoader('Lezzycan', AppString.githubUrl)));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      'Click to see my github',
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
