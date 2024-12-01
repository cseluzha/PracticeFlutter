import 'package:formz/formz.dart';

// Define input validation errors
enum SlugError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Slug extends FormzInput<String, SlugError> {
  static final RegExp slugRegExp = RegExp(
    r'^[a-z0-9]+(?:-[a-z0-9]+)*$',
  );
  // Call super.pure to represent an unmodified form input.
  const Slug.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Slug.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == SlugError.empty) return 'The field is required';
    if (displayError == SlugError.format) {
      return 'The slug format is invalid';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  SlugError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return SlugError.empty;
    if (!slugRegExp.hasMatch(value)) {
      return SlugError.format;
    }
    return null;
  }
}
