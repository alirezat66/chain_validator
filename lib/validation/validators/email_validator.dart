import 'package:validator/validation/validator.dart';

class EmailValidator extends Validator {
  EmailValidator({Validator? next}) : super(nextValidator: next);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    } else if (!RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$").hasMatch(value)) {
      return "Enter a valid email address";
    }
    return super.validate(value);
  }
}