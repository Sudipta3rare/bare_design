import 'package:bare_design/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../utils/appColors.dart';
import '../../../../utils/themes.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 100,
          child: GetBuilder<AccountController>(
            builder: (ctrl) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          // Add the desired right padding value
                          child: Text(
                            ctrl.fullName ,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              // Add the desired right padding value
                              child:
                                  Text(ctrl.mobile, style: TextStyle(fontSize: 15)),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.verified, color: Colors.green),
                            Text(
                              "Verified",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.toNamed("/personal_information");
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.shopping_cart, color: AppColors.buttonColor),
              title: Text(
                "My Order",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.thermostat_auto_rounded,
                  color: AppColors.buttonColor),
              title: Text(
                "Hot or Not",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.fitness_center, color: AppColors.buttonColor),
              title: Text(
                "Fit Test",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.wallet, color: AppColors.buttonColor),
              title: Text(
                "Bank Details",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.location_on, color: AppColors.buttonColor),
              title: Text(
                "My Addresses",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.volume_up, color: AppColors.buttonColor),
              title: Text(
                "Refer a friend",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.card_giftcard, color: AppColors.buttonColor),
              title: Text(
                "My Coupons",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ExpansionTile(
            title: const ListTile(
              leading: Icon(Icons.sms, color: AppColors.buttonColor),
              title: Text(
                "Contact Us",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            textColor: AppColors.paragraphColor,
            collapsedTextColor: AppColors.paragraphColor,
            iconColor: AppColors.paragraphColor,
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            children: [
              ExpansionTile(
                title: const Text("Sub-Category"),
                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.scaffoldColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                collapsedIconColor: AppColors.paragraphColor,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/productList');
                      },
                      child: Text(
                        "Product Type",
                        style: Styles().p2TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: ListTile(
            title: const ListTile(
              leading: Icon(Icons.logout, color: AppColors.buttonColor),
              title: Text(
                "Logout",
                style: TextStyle(
                  color: AppColors.paragraphColor,
                ),
              ),
            ),
            //tileColor: AppColors.shadowColor,
            onTap: () {
              // Add your logout logic here
            },
          ),
        )
      ],
    ));
  }
}
