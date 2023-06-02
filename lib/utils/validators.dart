
class Validator {
  Validator();

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) return 'Email address is required.';

    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Enter valid email address.';
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) return 'Password is required.';

    const String pattern =
        r'^((?=.*?[0-9]).{8,})$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value.trim())) {
      return 'Enter valid password.';
    }
    return null;
  }

  String? validateFields(String? value, String field) {
    if (value!.trim().isEmpty) return '$field is required.';

    // if (value.trim().contains(' ')) {
    //   return 'Please remove the space.';
    // }
    return null;
  }
}