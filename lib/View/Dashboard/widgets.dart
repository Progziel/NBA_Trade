part of dashboard_view;

class DashboardIcons extends StatelessWidget {
  const DashboardIcons({
    super.key,
    required this.icon,
    required this.text,this.onTap,
  });

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.height / 11,
        width: context.width / 5.5,
        margin: EdgeInsets.only(top: 10),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.cyan)),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              child: Icon(
                icon,
                color: Colors.white,
                weight: 500,
              ),
            ),
            Text(
              '$text',
              style: TextStyle(color: kPrimaryColor, fontSize: 9),
            )
          ],
        ),
      ),
    );
  }
}

class MyTab extends StatelessWidget {
  MyTab(
      {super.key,
      required this.icon,
      required this.text,
      required this.selectedTab});

  final IconData icon;
  final String text;
  bool selectedTab = false;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: selectedTab ? Colors.white : Colors.black,
          size: 16,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
              color: selectedTab ? Colors.white : Colors.black, fontSize: 11),
        ),
      ],
    ));
  }
}

class PlayerData extends StatelessWidget {
  const PlayerData({
    super.key, required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.snackbar('Note!', 'Routing To Player Details Screen',
          colorText: Colors.white),
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        height: context.height / 5.5,
        width: context.width / 5.2,
        child: Image.asset(
          'images/player5.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  // const PostHeader({
  //   super.key,
  //   required DashboardController dashboardController,
  // }) : _dashboardController = dashboardController;
  //
  DashboardController _dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('images/user.jpeg'),
            ),
            Text(' s/Space ',
                style: TextStyle(
                  fontSize: 10,
                )),
            Text('Posted by: ',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('user786 ',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text('3 Days ago',
                style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        //View Type (Full/Short)
        InkWell(
          onTap: () {
            if (_dashboardController.isExpanded.value == false) {
              _dashboardController.isExpanded.value = true;
            } else {
              _dashboardController.isExpanded.value = false;
            }
            print(_dashboardController.isExpanded.value);
          },
          child: Obx(
            () => Row(
              children: [
                Text(
                    _dashboardController.isExpanded.value
                        ? 'View short'
                        : 'View full',
                    style: TextStyle(
                      fontSize: 10,
                    )),
                Icon(
                  _dashboardController.isExpanded.value
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 17,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PostBody extends StatelessWidget {
  DashboardController _dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _dashboardController.isExpanded.value == false
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Player/Team Photos
                Container(
                  child: Row(
                    children: _dashboardController.playerDataList
                  ),
                ),
                //Details Text
                Expanded(
                  child: Container(
                    child: Text(
                        maxLines: 6,
                        softWrap: false,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        """The standard Lorem Ipsum passage is: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"""),
                  ),
                ),
              ],
            )
          : Column(
        children: [
          //Player/Team Photos
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _dashboardController.playerDataList,
            ),
          ),
          //Details Text
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
                maxLines: 6,
                softWrap: false,
                style: TextStyle(overflow: TextOverflow.ellipsis),
                """The standard Lorem Ipsum passage is: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"""),
          ),
        ],
      ),
    );
  }
}