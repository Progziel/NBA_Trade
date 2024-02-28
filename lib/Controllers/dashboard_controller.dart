import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../View/Dashboard/dashboard.dart';

class DashboardController extends GetxController{
  RxBool isExpanded = false.obs;


  //Players Data List (Shown On Post Body)
  List<PlayerData> playerDataList = [
    PlayerData(image: 'images/player5.jpg'),
    PlayerData(image: 'images/player4.jpeg'),
    PlayerData(image: 'images/player3.jpeg'),
  ];

  ///Dashboard Blue Icons Widgets List
  ///All Widgets Have OnTap Property To Route To Desired Screen
  List<DashboardIcons> dashboardIcons1 = [
    DashboardIcons(
      text: 'Team Selection',
      icon: Symbols.diversity_2,
    ),
    DashboardIcons(
      text: 'Trade',
      icon: Symbols.send_time_extension,
    ),
    DashboardIcons(
      text: 'NBA Contracts',
      icon: Symbols.diversity_3,
    ),
    DashboardIcons(
      text: 'Compare',
      icon: Symbols.compare_arrows,
    ),
  ];
  List<DashboardIcons> dashboardIcons2 = [
    // DashboardIcons(
    //   text: 'Approval',
    //   icon: Symbols.order_approve,
    // ),
    DashboardIcons(
      text: 'News',
      icon: Symbols.brand_awareness,
    ),
    DashboardIcons(
      text: 'Spaces',
      icon: Symbols.public,
    ),
    DashboardIcons(
      text: 'Chatrooms',
      icon: Symbols.inbox,
    ),
  ];

}