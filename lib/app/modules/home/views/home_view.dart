import 'package:flutter/material.dart';
import 'package:medical_insurance_system/app/components/drawer.dart';
import 'package:medical_insurance_system/app/data/local/my_shared_pref.dart';
import 'package:medical_insurance_system/utils/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: kWhiteColor),
          title: Text(
            MySharedPref.getName(),
            style: TextStyle(color: kWhiteColor),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: kSecondaryBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
          ),
        ),
        drawer: SideDrawer(),
        body: ListView(
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Text("Trending Insurance Policies"),
                    trailing: Text(
                      "See more...",
                      style: TextStyle(color: kPrimaryBlue),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          elevation: 10.0,
                          child: ListTile(
                            tileColor: kLightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dense: true,
                            title: Text("Insurance Policy ${index + 1}"),
                            subtitle: const Text("Insurance term: 3 years"),
                            trailing: const Text("2L INR "),
                          ),
                        );
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Text("Recent Medical Records"),
                    trailing: Text(
                      "See more...",
                      style: TextStyle(color: kPrimaryBlue),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          elevation: 10.0,
                          child:  ListTile(
                            tileColor: kLightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dense: true,
                            title: Text("Record Name"),
                            subtitle: Text("Hospital : Apollo Hospital"),
                            trailing: Text("2L INR "),
                          ),
                        );
                      })
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    title: Text("Your Insurance Policies "),
                    trailing: Text(
                      "See more...",
                      style: TextStyle(color: kPrimaryBlue),
                    ),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          elevation: 10.0,
                          child: ListTile(
                            tileColor: kLightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            dense: true,
                            title: Text("Policy Name ${index + 1}"),
                            subtitle: const Text("Insurance term: 3 years"),
                            trailing: const Text("2L INR "),
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ));
  }
}
