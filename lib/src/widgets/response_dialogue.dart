// import 'package:flutter/material.dart';
// import 'package:hng_task_1/src/constants/colors.dart';


// import '../../main.dart';

// class ResponseDialogFragment extends StatelessWidget {
//   final String? description;

//   final bool gotoDashBoard;

//   final Function? listener;

//   ResponseDialogFragment(this.description, this.gotoDashBoard, this.listener);

//   @override
//   Widget build(BuildContext context) {


//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: dialogContent(context),
//     );
//   }

//   dialogContent(BuildContext context) {
//     return Card(
//       color: AppColors.colorWhite,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: fabSpacing ,
//             child: Column(
//               children: <Widget>[
//                 fabSize,
//                 Image.asset("assets/images/success_3.png"),
//              //   fabSize,
//               //  fabSize,
//                 const Center(
//                   child: Text('Sucessful'),
//                 ),
//                 // Text(description, style: style, textAlign: TextAlign.center,),
//                 Text(
//                   description!, //'Your password has been succesfully changed,you can now login with your new password'
//                   style: style6,
//                   textAlign: TextAlign.center,
//                 ),
//                 fabSize,
//                 Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: colorPrimary,
//                   child: MaterialButton(
//                     minWidth: MediaQuery.of(context).size.width,
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       if (gotoDashBoard) {
//                         navigateTo(PageRoutes.dashboard, null, false);
//                       }
//                       listener?.call();
//                     },
//                     child: Text(
//                       "Close",
//                       textAlign: TextAlign.center,
//                       style: style.copyWith(
//                         color: Colors.white,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//                 fabSize
//               ],
//             ),
//           )
//         ],
//         mainAxisSize: MainAxisSize.min,
//       ),
//     );
//   }
//       final EdgeInsets smallSpacing = EdgeInsets.all(5.w);
// final EdgeInsets mediumSpacing = EdgeInsets.all(10.w);
// final EdgeInsets fabSpacing = EdgeInsets.all(16.w);
// final EdgeInsets bigSpacing = EdgeInsets.all(20.w);
// }
