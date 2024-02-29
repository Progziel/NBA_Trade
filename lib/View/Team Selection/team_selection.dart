import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nba_trade/Controllers/universal_controller.dart';
import 'package:nba_trade/Models/my_player_model.dart';

import '../../helper/colors.dart';
import '../../helper/textfield.dart';
import '../Dashboard/dashboard.dart';

class TeamSelection extends StatefulWidget {
  const TeamSelection({super.key});

  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  //Init State To Initialize tab Controller And Controller Listener
  @override
  void initState() {
    print('INIT CALLED');
    // universalController.fetchPlayerList();
    // Initialize Tab Controller
    tabController = TabController(length: 2, vsync: this);
    //Add Listener To Tab Controller When Tab Changes
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  UniversalController universalController = Get.find<UniversalController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Custom Appbar
        appBar: PreferredSize(
          preferredSize: Size(0, context.height / 6.7),
          child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: kBoxShadowColor,
                        blurRadius: 10.0,
                        spreadRadius: 5,
                        offset: Offset(0, 6))
                  ],
                  color: kPrimaryColor,
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(35))),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    //Menu Bar & Profile Picture
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        CircleAvatar(
                          backgroundImage: AssetImage('images/user.jpeg'),
                        )
                      ],
                    ),
                    //NBA Text
                    Text('NBA Team Selection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    SizedBox(height: 5),
                  ],
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
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
                          preferredSize: Size(0, context.height / 9),
                          child: AppBar(
                            toolbarHeight: context.height / 5,
                            centerTitle: true,
                            backgroundColor: Colors.white,
                            title: TabBar(
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.white,
                                // padding: EdgeInsets.zero,
                                // indicatorPadding: EdgeInsets.zero,
                                // labelPadding:
                                //  EdgeInsets.only(left: context.width /16, right: context.width / 10),
                                controller: tabController,
                                // indicatorPadding:
                                // EdgeInsets.only(bottom: context.height / 130),
                                tabAlignment: TabAlignment.center,
                                indicatorSize: TabBarIndicatorSize.tab,
                                // indicator: UnderlineTabIndicator(
                                //     borderRadius: BorderRadius.circular(5),
                                // borderSide: BorderSide(
                                //     color: kPrimaryColor,
                                // width: context.width / 10)
                                // ),
                                //Change background color from here
                                tabs: [
                                  MyTab(
                                      textUnselectedColor: Colors.white,
                                      unselectedColor: Colors.grey,
                                      text: 'Teams',
                                      selectedTab: tabController.index == 0
                                          ? true
                                          : false),
                                  MyTab(
                                      textUnselectedColor: Colors.white,
                                      unselectedColor: Colors.grey,
                                      text: 'Your Draft Board',
                                      selectedTab: tabController.index == 1
                                          ? true
                                          : false),
                                ]),
                          ),
                        ),
                        body: TabBarView(controller: tabController, children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                              itemCount: UniversalController.players1.length,
                                itemBuilder: (context, index) {
                                  MyPlayerModel1 model = UniversalController
                                      .players1[index];
                                  return PlayerCard(playerName: model.firstName,
                                      sgGroup: model.position,
                                      teamName: model.team,
                                      image: model.photoUrl);
                                }),
                          ),
                          Center(
                            child: Text('DRAFT'),
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key, required this.playerName, required this.sgGroup, required this.teamName, required this.image,
  });

  final String? playerName;
  final String? sgGroup;
  final String? teamName;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor,
                blurRadius: 10.0,
                spreadRadius: 5,
                offset: Offset(0, 6))
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: context.height / 11,
                    width: context.width / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                            '$image',
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$playerName',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$sgGroup',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '$teamName',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Icon(Icons.supervised_user_circle),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 30,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ))),
                        onPressed: () =>
                            Get.snackbar(
                                'Note!', 'Adding Player To Draft',
                                colorText: Colors.white),
                        child: const Text(
                          '+Add',
                          style: TextStyle(fontSize: 9, color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
