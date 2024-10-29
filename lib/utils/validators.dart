String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!isValidEmail(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  return emailRegex.hasMatch(email);
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? validatePhoneNo(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your Phone No.';
  }
  return null;
}