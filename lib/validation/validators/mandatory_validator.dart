import 'package:validator/validation/validator.dart';

class MandatoryValidator extends Validator {
  MandatoryValidator({Validator? next}) : super(nextValidator: next);

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    }
    return super.validate(value);
  }
}