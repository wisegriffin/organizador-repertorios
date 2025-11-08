String? validateTextNotEmpty(String? value, String errorMessage) {
  return value == null || value.isEmpty ? errorMessage : null;
}
