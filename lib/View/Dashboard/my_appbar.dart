part of dashboard_view;


class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Blue Container Shade
        Container(
            height: context.height / 4.7,
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
                            Icons.menu,
                            color: Colors.white,
                          )),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/user.jpeg'),
                      )
                    ],
                  ),
                  //NBA Text
                  Text('NBA Trade Machine',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  SizedBox(height: 5),
                  //Search TextField
                  CustomTextField(
                      suffixIcon: Icon(Icons.search),
                      customBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      textFieldWidth: context.width / 1.30,
                      textFieldHeight: context.height / 20,
                      hinText: 'Search Here',
                      controller: TextEditingController()),
                ],
              ),
            )),
        ///NOT IN USE/////////////////////////////////
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(
        //     height: context.height / 14,
        //     width: context.width / 1.12,
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //             color: kBoxShadowColor,
        //             blurRadius: 10.0,
        //             spreadRadius: 1,
        //             offset: Offset(0, 6))
        //       ],
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(4),
        //     ),
        //     //TODO DROPDOWN ITEMS RENDERFLEX ISSUE
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         CustomDropDown(
        //           customBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(5),
        //               borderSide: BorderSide(color: Colors.transparent)),
        //           dropDownWidth: context.width / 5.3,
        //           dropDownMenuItems: [],
        //           onChanged: (val) {},
        //           hintText: 'SPACES',
        //           iconColor: Colors.black,
        //         ),
        //         CustomDropDown(
        //           customBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(5),
        //               borderSide: BorderSide(color: Colors.transparent)),
        //           dropDownWidth: context.width / 5.9,
        //           dropDownMenuItems: [],
        //           onChanged: (val) {},
        //           hintText: 'TOOLS',
        //           iconColor: Colors.black,
        //         ),
        //         CustomDropDown(
        //           customBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(5),
        //               borderSide: BorderSide(color: Colors.transparent)),
        //           dropDownWidth: context.width / 6.6,
        //           onChanged: (val) {},
        //           dropDownMenuItems: [],
        //           hintText: 'POST',
        //           iconColor: Colors.black,
        //         ),
        //         CustomDropDown(
        //           customBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(5),
        //               borderSide: BorderSide(color: Colors.transparent)),
        //           dropDownWidth: context.width / 4.6,
        //           onChanged: (val) {},
        //           dropDownMenuItems: [],
        //           hintText: 'RESOURCES',
        //           iconColor: Colors.black,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
