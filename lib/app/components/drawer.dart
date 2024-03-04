import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/common_utils.dart';
import '../data/local/my_shared_pref.dart';
import '../routes/app_pages.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              MySharedPref.getEmail() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.SEARCH);
              MySharedPref.getEmail() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.SEARCH);
            },
            child: UserAccountsDrawerHeader(
              accountName: Text(MySharedPref.getName()),
              accountEmail: MySharedPref.getEmail() == "guest@email.com"
                  ? Container(
                      height: 10,
                      width: 10,
                    )
                  : Text(MySharedPref.getEmail()),
              currentAccountPicture: Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60)),
                //backgroundColor: Colors.white70,
                //minRadius: 60.0,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      //  color: Colors.white70,
                      borderRadius: BorderRadius.circular(60)),
                  child: ClipOval(
                      child: Image.asset(
                    "assets/user.png",
                    width: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        dynamic stackTrace) {
                      return Container(
                          color: Colors.red.withOpacity(0.1),
                          width: 90,
                          height: 90,
                          child: Center(
                            child: Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.red.withOpacity(0.3),
                              size: 28,
                            ),
                          ));
                    },
                    height: 90,
                  )),
                ),
              ),
              decoration: const BoxDecoration(
                color: kPrimaryBlue,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Medical Record'),
            onTap: () => {Get.toNamed(AppPages.ADDRECORD)},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Get.offAllNamed(AppPages.SIGNIN);
              MySharedPref.clearSession();
            },
          ),
          ExpansionTile(
            title: Text(
              "Settings & Support",
              style: TextStyle(color: kSecondaryBlue),
            ),
            initiallyExpanded: true,
            children: [
              ListTile(
                minLeadingWidth: 1,
                dense: true,
                leading: Icon(Icons.support_agent_sharp),
                title: Text('Contact Us'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                minLeadingWidth: 1,
                dense: true,
                leading: Icon(Icons.phone_forwarded),
                title: Text('Call Us'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
