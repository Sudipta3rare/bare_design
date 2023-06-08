import 'package:bare_design/controllers/account_controller.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  String? selectedGender;
  bool isDataDisplayed = false; // Flag variable to track data display
  late SharedPreferences _prefs;
  bool isEmailValid = true;

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

    setState(() {
      fullNameController.text = fullName;
      emailController.text = email;
      passwordController.text = password;
      mobileNumberController.text = mobileNumber;
      dobController.text = dob;
      selectedGender = gender; // Set the selected gender value
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    mobileNumberController.dispose();
    dobController.dispose();
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
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
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
                  errorText: isEmailValid ? null : 'Please enter a valid email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    isEmailValid = EmailValidator.validate(value);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
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
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
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
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: dobController,
                focusNode: AlwaysDisabledFocusNode(),
                onTap: () async {
                  // Show date picker and update the dobController's value
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    dobController.text =
                        formattedDate; // Update controller value with selected date
                  }
                },
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
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
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
                items: <String>['Male', 'Female', 'Other','']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AccountController>(
              builder: (ctrl) {
                return ElevatedButton(
                  onPressed: () async {
                    if (!isDataDisplayed) {
                      final fullName = fullNameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;
                      final mobileNumber = mobileNumberController.text;
                      final dob = dobController.text;
                      final gender = selectedGender ??
                          ''; // Use selectedGender if not null, otherwise use an empty string

                      // Save the entered values to shared preferences
                      await _prefs.setString('fullName', fullName);
                      await _prefs.setString('email', email);
                      await _prefs.setString('password', password);
                      await _prefs.setString('mobileNumber', mobileNumber);
                      await _prefs.setString('dob', dob);
                      await _prefs.setString('gender', selectedGender ?? '');
                        ctrl.fullNmae = fullName;
                        ctrl.mobile = mobileNumber;
                        ctrl.update();
                      // Set the flag to true to indicate data display
                      setState(() {
                        isDataDisplayed = true;
                      });

                      Get.back();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.buttonColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(35, 0, 35, 0)),
                  ),
                  child: const Text('Save'),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

bool isValidEmail(String email) {
  return EmailValidator.validate(email);
}
