class ProductValidators {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    const fieldName = 'Price';
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) {
      return requiredError;
    }
    if (double.tryParse(value!) == null) {
      return 'Enter a valid number for the price.';
    }
    return null;
  }

  static String? validateQuantity(String? value) {
    const fieldName = 'Quantity';
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) {
      return requiredError;
    }
    if (int.tryParse(value!) == null) {
      return 'Enter a valid number for the quantity.';
    }
    if (int.tryParse(value) != null && int.parse(value) < 0) {
      return 'Quantity cannot be negative.';
    }
    return null;
  }

  static String? validateOptionalOldPrice(String? value) {
    if (value != null && value.isNotEmpty) {
      if (int.tryParse(value) == null) {
        return 'Enter a valid number for Old Price.';
      }
    }
    return null;
  }

  static String? validateDiscount(String? value) {
    if (value != null && value.isNotEmpty) {
      final discountValue = int.tryParse(value);

      if (discountValue == null) {
        return 'Enter a valid number for Discount.';
      }
      if (discountValue < 0 || discountValue > 100) {
        return 'Discount must be between 0 and 100.';
      }
    }
    return null;
  }
}