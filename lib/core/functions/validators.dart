class Validators {
  
  //! VALIDATE for email 
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email kiritilishi kerak';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email formati noto‘g‘ri';
    }

    return null;
  }

  //! VALIDATE for userName
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Foydalanuvchi nomi kiritilishi kerak';
    }

    if (value.length < 3) {
      return 'Foydalanuvchi nomi kamida 3 ta belgidan iborat bo‘lishi kerak';
    }

    return null;
  }

  //! VALIDATE for password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parol kiritilishi kerak';
    }

    if (value.length < 6) {
      return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak';
    }

    return null;
  }

  //! VALIDATE for prhone number 
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon raqam kiritilishi kerak';
    }

    final phoneRegex = RegExp(r'^\+\d{3} \d{2} \d{3} \d{2} \d{2}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Telefon raqam formati noto‘g‘ri: +999 90 000 00 00';
    }

    return null;
  }

  //! VALIDATE for Email end  
  static String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon raqam kiritilishi kerak';
    }
    bool isValidate = false;
    String error = "";

    if (validateEmail(value) != null) {
      isValidate = false;
      error =
          "Iltimos tog'ri Email yoki telefon nomer kiriting \n+999 90 000 00 00 ";
    } else {
      isValidate = true;
    }

    if (isValidate == false) {
      if (validatePassword(value) != null) {
        error =
            "Iltimos tog'ri Email yoki telefon nomer kiriting \nsalom@gmail.com ";
      } else {
        isValidate = true;
      }
    }
    if (isValidate) {
      return null;
    } else {
      return error;
    }
  }
}