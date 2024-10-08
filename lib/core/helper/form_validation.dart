
class FormValidation {
  ///Check if field isn't empty
  String? isValidLength(String value) {
    if (value.length <= 2) {
      return 'enter_valid_information';
    }
    return null;
  }

  String? isValidFirstName(String value) {
    if (value.length <= 2) {
      return 'enter_your_first_name';
    }
    return null;
  }

  String? isValidLastName(String value) {
    if (value.length <= 2) {
      return 'enter_your_last_name';
    }
    return null;
  }

  String? isValidPassword(String value) {
    if (value.length <= 5) {
      return 'Wrong password';
    }
    return null;
  }

  static bool isNotValid(String phone) {
    return !RegExp(r"^05[0-9]{8,8}$").hasMatch(phone);
  }

  static bool isNotValidEmail(String email) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
