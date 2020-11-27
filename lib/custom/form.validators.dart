import 'package:email_validator/email_validator.dart';

class Validator {
  static password(String password) {
    Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(password))
      return 'Invalid password';
    else
      return null;
  }

  static username(String username, String label) {
    Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(username))
      return label;
    else
      return null;
  }

  static email(String email) {
    return EmailValidator.validate(email) ? null : "Invalid email address";
  }

  static phone(String value, String s) {
    return null;
  }

  static required(String value, String s) {
    return value.isEmpty || value == null ? s : null;
  }
}
