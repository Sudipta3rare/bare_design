import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);


  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  bool isDataDisplayed = false; // Flag variable to track data display
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve saved data and update the text fields if available
    final fullName = _prefs.getString('fullName') ?? '';
    final email = _prefs.getString('email') ?? '';
    final password = _prefs.getString('password') ?? '';
    final mobileNumber = _prefs.getString('mobileNumber') ?? '';
    final dob = _prefs.getString('dob') ?? '';
    final gender = _prefs.getString('gender') ?? '';

    fullNameController.text = fullName;
    emailController.text = email;
    passwordController.text = password;
    mobileNumberController.text = mobileNumber;
    dobController.text = dob;
    genderController.text = gender;
  }
  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    dobController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ApplicationBar(
        title: "Personal Information",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: mobileNumberController,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Date Of Birth',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: genderController,
                decoration: const InputDecoration(
                  labelText: 'Gender',
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
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!isDataDisplayed) {
                  final fullName = fullNameController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  final mobileNumber = mobileNumberController.text;
                  final dob = dobController.text;
                  final gender = genderController.text;

                  // Save the entered values to shared preferences
                  await _prefs.setString('fullName', fullName);
                  await _prefs.setString('email', email);
                  await _prefs.setString('password', password);
                  await _prefs.setString('mobileNumber', mobileNumber);
                  await _prefs.setString('dob', dob);
                  await _prefs.setString('gender', gender);

                  // Set the flag to true to indicate data display
                  setState(() {
                    isDataDisplayed = true;
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonColor),
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(35, 0, 35, 0)),
              ),
              child: const Text('Save'),
            )

          ],
        ),
      ),
    );
  }
}
