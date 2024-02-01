import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

    String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'The field is required.';
    if (displayError == PasswordError.length) return 'Minimum 8 characters.';
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 8) return PasswordError.length;
    return null;
  }
}
