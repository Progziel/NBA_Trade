library dashboard_view;

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nba_trade/controllers/dashboard_controller.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../helper/colors.dart';
import '../../helper/textfield.dart';

part 'widgets.dart';
part 'my_appbar.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  //Init State To Initialize Controller And Controller Listener
  @override
  void initState() {
    // Initialize Tab Controller
    tabController = TabController(length: 4, vsync: this);
    //Add Listener To Tab Controller When Tab Changes
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  DashboardController _dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(0, context.height / 3.8),
          ///Custom AppBar
          child: const MyAppBar(),
        ),
        body: SingleChildScrollView(
          //Dashboard Blue Icons
          child: Column(
            children: [
              SizedBox(height: 10),
              ///Dashboard Icons
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _dashboardController.dashboardIcons1,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _dashboardController.dashboardIcons2,
              ),
              //Tabs View
              SizedBox(
                height: context.height / 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: PreferredSize(
                      preferredSize: Size(0, context.height / 7),
                      child: AppBar(
                        toolbarHeight: context.height / 5,
                        centerTitle: true,
                        backgroundColor: Colors.transparent,
                        bottom: PreferredSize(
                            preferredSize: const Size(0, 0),
                            child: Container(
                              height: context.height / 17,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              margin:
                              const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(width: 0.0)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundImage:
                                    AssetImage('images/user.jpeg'),
                                  ),
                                  //Create Post
                                  Row(
                                    children: [
                                      CustomTextField(
                                          onTap: ()=> Get.snackbar('Note!', 'Routing To Create Post Screen!',colorText: Colors.white),
                                        keyboardType: TextInputType.none,
                                          customBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black, width: 0.5),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          textFieldHeight: context.height / 22,
                                          textFieldWidth: context.width / 1.7,
                                          hinText: 'Create Post Here',
                                          controller: TextEditingController()),
                                      SizedBox(width: 10),
                                      SizedBox(
                                        width: context.width / 5.5,
                                        height: context.height / 22,
                                        child: TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    kPrimaryColor),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ))),
                                            onPressed: ()=> Get.snackbar('Note!', 'Routing To Create Post Screen!',colorText: Colors.white),
                                            child: const Text(
                                              'Post',
                                              style: TextStyle(
                                                  fontSize: 9, color: Colors.white),
                                              textAlign: TextAlign.center,
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                        title: TabBar(
                            padding: EdgeInsets.zero,
                            // indicatorPadding: EdgeInsets.zero,
                            labelPadding:
                            const EdgeInsets.only(left: 12, right: 12),
                            controller: tabController,
                            indicatorPadding:
                            EdgeInsets.only(bottom: context.height / 130),
                            tabAlignment: TabAlignment.center,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: UnderlineTabIndicator(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: kPrimaryColor,
                                    width: context.width / 10)),
                            //Change background color from here
                            tabs: [
                              MyTab(
                                  icon: Symbols.feed,
                                  text: 'My Feed',
                                  selectedTab:
                                  tabController.index == 0 ? true : false),
                              MyTab(
                                  icon: Symbols.trending_up,
                                  text: 'Trending',
                                  selectedTab:
                                  tabController.index == 1 ? true : false),
                              MyTab(
                                  icon: Symbols.autorenew,
                                  text: 'New',
                                  selectedTab:
                                  tabController.index == 2 ? true : false),
                              MyTab(
                                  icon: Symbols.subheader,
                                  text: 'Top',
                                  selectedTab:
                                  tabController.index == 3 ? true : false),
                            ]),
                      ),
                    ),
                    body: TabBarView(controller: tabController, children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Filter Posts By Type ↧',
                                style: TextStyle(fontSize: 9)),
                            //Post Short View
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  //Post Header Full/Short View
                                  PostHeader(),
                                  SizedBox(height: context.height / 70),
                                  //Post Body
                                  PostBody(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text('Trending'),
                      ),
                      Center(
                        child: Text('New'),
                      ),
                      Center(
                        child: Text('Top'),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


