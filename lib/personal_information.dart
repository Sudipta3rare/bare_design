import 'package:bare_design/controllers/account_controller.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {


 // Flag variable to track data display


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ApplicationBar(
        title: "Personal Information",
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AccountController>(
            builder: (ctrl) {
              return Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Center(),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   child: TextField(
                  //
                  //     controller: ctrl.fullNameController,
                  //     decoration: InputDecoration(
                  //       // labelText: 'Full Name',
                  //       hintText: ctrl.savedFeild.read("UserName") ??
                  //           "Full Name",
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //   child: TextField(
                  //     controller: ctrl.emailController,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Email',
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //   child: TextField(
                  //     controller: ctrl.passwordController,
                  //     obscureText: true,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Password',
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //   child: TextField(
                  //     controller: ctrl.mobileNumberController,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Mobile Number',
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //   child: TextField(
                  //     controller: ctrl.dobController,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Date Of Birth',
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //   child: TextField(
                  //     controller: ctrl.genderController,
                  //     decoration: const InputDecoration(
                  //       labelText: 'Gender',
                  //       labelStyle: TextStyle(color: AppColors.buttonColor),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(color: AppColors.buttonColor),
                  //       ),
                  //       fillColor: Colors.white,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),
                  Form(
                    key: ctrl.formKey,
                    child: MyAccountUpdateForm("UserName", (value){
                      {
                        ctrl.user.value.name = value!;
                      print(ctrl.user.value.name);
                    }
                    }, ctrl),),

                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<AccountController>(
                      builder: (ctrl) {
                        return ElevatedButton(
                            onPressed: () {
                              ctrl.formKey.currentState?.save();
                              ctrl.storeUserDetials();
                              // listViews.add(Obx(()=> Text("${accountCtrl.user.name}")));
                              ctrl.update();
                              Get.back();
                            },
                          // onPressed: () {
                          //
                          //   if (!ctrl.isDataDisplayed) {
                          //     // Get the entered values
                          //     final fullName = ctrl.fullNameController.text;
                          //     final email = ctrl.emailController.text;
                          //     final password = ctrl.passwordController.text;
                          //     final mobileNumber = ctrl.mobileNumberController
                          //         .text;
                          //     final dob = ctrl.dobController.text;
                          //     final gender = ctrl.genderController.text;
                          //
                          //     // Update the respective text fields with the entered values
                          //     ctrl.fullNameController.text = fullName;
                          //     ctrl.emailController.text = email;
                          //     ctrl.passwordController.text = password;
                          //     ctrl.mobileNumberController.text = mobileNumber;
                          //     ctrl.dobController.text = dob;
                          //     ctrl.genderController.text = gender;
                          //
                          //     // Set the flag to true to indicate data display
                          //     setState(() {
                          //       ctrl.isDataDisplayed = true;
                          //       ctrl.savedFeild.write(
                          //           "UserName", ctrl.fullNameController.text);
                          //       ctrl.savedFeild.write(
                          //           "email", ctrl.emailController.text);
                          //       ctrl.savedFeild.write(
                          //           "mobile", ctrl.mobileNumberController.text);
                          //       ctrl.savedFeild.write(
                          //           "dob", ctrl.dobController.text);
                          //       ctrl.savedFeild.write(
                          //           "gender", ctrl.genderController.text);
                          //       // going back to text
                          //       Get.back();
                          //     });
                          //   }
                          // },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.buttonColor),
                            padding: MaterialStateProperty.all(const EdgeInsets
                                .fromLTRB(35, 0, 35, 0)),
                          ),
                          child: const Text('Save'),
                        );
                      }
                  )
                ],
              );
            }
        ),
      ),
    );

    }
  Widget MyAccountUpdateForm(String title, Function(String?) onSaved, AccountController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 5),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Full Name TFF',
          labelStyle: TextStyle(color: AppColors.buttonColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
          initialValue: ctrl.savedFeild.read(title) ?? "",
        onSaved: onSaved,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Text is empty';
          }
          return null;
        },

      ),
    );
  }}