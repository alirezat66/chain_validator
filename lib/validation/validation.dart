import 'package:validator/validation/validation_type.dart';
import 'package:validator/validation/validator.dart';
import 'package:validator/validation/validators/email_validator.dart';
import 'package:validator/validation/validators/mandatory_validator.dart';

class Validation {
  static String? Function(String?) build(List<ValidationType> types) {
    Validator? first;

    for (var type in types.reversed) {
      switch (type) {
        case ValidationType.email:
          first = EmailValidator(next: first);
          break;
        case ValidationType.mandatory:
          first = MandatoryValidator(next: first);
          break;
        default:
          throw UnimplementedError('Validator for ${type.toString()} is not implemented');
      }
    }

    return (String? value) => first?.validate(value);
  }
}
