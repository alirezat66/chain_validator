abstract class Validator {
  Validator? nextValidator;

  Validator({this.nextValidator});

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    // Pass to the next validator if the current one finds no errors.
    return nextValidator?.validate(value);
  }
}