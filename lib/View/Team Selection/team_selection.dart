// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:nba_trade/helper/colors.dart';
//
// import '../../helper/circular_profile_avatar.dart';
// import '../../helper/custom_text.dart';
//
//
// class TeamSelection extends StatefulWidget {
//   const TeamSelection({super.key});
//
//   @override
//   State<TeamSelection> createState() => _TeamSelectionState();
// }
//
// class _TeamSelectionState extends State<TeamSelection> {
//
//
//   Tab buildTab({required BuildContext context, required String title}) {
//     return Tab(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
//         child: CustomTextWidget(
//           text: title,
//           fontSize: 14.0,
//           fontWeight: FontWeight.w500,
//           textColor: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade300,
//         body: DefaultTabController(
//           length: 2,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     padding:
//                     const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
//                     height: Get.height * 0.15,
//                     decoration: const BoxDecoration(
//                       color: kPrimaryColor,
//                       // color: ColorAssets.primary,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(left: 12.0, right: 12.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   Get.back();
//                                 },
//                                 child: const Icon(
//                                   Icons.arrow_back_ios_outlined,
//                                   color: kPrimaryColor,
//                                   // color: ColorAssets.grey,
//                                 ),
//                               ),
//                               const CircularProfilePictureAvatar()
//                             ],
//                           ),
//                         ),
//                         const CustomTextWidget(
//                           text: 'NBA Team Selection',
//                           // textColor: ColorAssets.white,
//                           textColor: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                         const SizedBox(height: 16.0),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 width: Get.width,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                 ),
//                 child: ButtonsTabBar(
//                   backgroundColor: kPrimaryColor,
//                   // backgroundColor: ColorAssets.primary,
//                   unselectedBackgroundColor: Colors.grey[600],
//                   unselectedLabelStyle: const TextStyle(color: Colors.white),
//                   labelStyle: const TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                   tabs: [
//                     buildTab(title: 'Teams', context: context),
//                     buildTab(title: 'Your Draft Board', context: context),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     Team(apiController: apiController),
//                     Draftboard(controller: apiController,),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
