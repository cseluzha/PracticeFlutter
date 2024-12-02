import 'package:formz/formz.dart';

// Define input validation errors
enum StockError { empty, value, format }

// Extend FormzInput and provide the input type and error type.
class Stock extends FormzInput<int, StockError> {
  static final RegExp stockRegExp = RegExp(
    r'^[0-9]+$',
  );
  // Call super.pure to represent an unmodified form input.
  const Stock.pure() : super.pure(0);

  // Call super.dirty to represent a modified form input.
  const Stock.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == StockError.empty) return 'The field is required';
    if (displayError == StockError.value) {
      return 'The value must be greater than or equal to 0';
    }
    if (displayError == StockError.format) {
      return 'The stock format is invalid';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  StockError? validator(int value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return StockError.empty;
    }
    if (!stockRegExp.hasMatch(value.toString())) return StockError.format;
    if (value <= 0) return StockError.value;
    return null;
  }
}
