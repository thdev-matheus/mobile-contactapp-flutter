class Validator {
  static Map<String, dynamic> emailValidation(String email) {
    email = email.toLowerCase();

    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
      caseSensitive: false,
      multiLine: false,
    );

    if (email == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regex.hasMatch(email)) {
      res['result'] = false;
      res['message'] = 'Digite um e-mail válido';
    }

    return res;
  }

  static Map<String, dynamic> passwordValidation(String password) {
    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regexUpperCase = RegExp(
      r'[A-Z]',
    );

    final RegExp regexLowerCase = RegExp(
      r'[a-z]',
    );

    final RegExp regexNumber = RegExp(
      r'\d',
    );

    final RegExp regexSpecialCharacter = RegExp(
      r'[^\w\s]',
    );

    if (password == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regexUpperCase.hasMatch(password)) {
      res['result'] = false;
      res['message'] = 'Ao menos 1 letra maiúscula';
    } else if (!regexLowerCase.hasMatch(password)) {
      res['result'] = false;
      res['message'] = 'Ao menos 1 letra minúscula';
    } else if (!regexNumber.hasMatch(password)) {
      res['result'] = false;
      res['message'] = 'Ao menos 1 número';
    } else if (!regexSpecialCharacter.hasMatch(password)) {
      res['result'] = false;
      res['message'] = 'Ao menos 1 caractere especial';
    } else if (password.length < 8) {
      res['result'] = false;
      res['message'] = 'Ao menos 8 caracteres';
    }

    return res;
  }

  static Map<String, dynamic> userNameValidation(String userName) {
    userName = userName.toLowerCase();

    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regex = RegExp(r'^(?!.*\s)(?=.*[a-zA-Z])[a-zA-Z0-9-]{1,10}$');

    if (userName == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regex.hasMatch(userName)) {
      res['result'] = false;
      res['message'] = 'Digite apenas letras, números e hífen';
    }

    return res;
  }

  static Map<String, dynamic> nameValidation(String name) {
    name = name.toLowerCase();

    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regex = RegExp(r'^[a-zA-Z]{3,}( [a-zA-Z]{2,})+$');

    if (name == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regex.hasMatch(name)) {
      res['result'] = false;
      res['message'] = 'Digite o nome completo';
    }

    return res;
  }

  static Map<String, dynamic> cpfValidation(String cpf) {
    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regex = RegExp(r'^[0-9]{11}$');

    if (cpf == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regex.hasMatch(cpf)) {
      res['result'] = false;
      res['message'] = 'Digite um CPF válido';
    }

    return res;
  }

  static Map<String, dynamic> phoneValidation(String phone) {
    Map<String, dynamic> res = {
      'result': true,
      'message': null,
    };

    final RegExp regex = RegExp(r'^[0-9]{11}$');

    if (phone == '') {
      res['result'] = false;
      res['message'] = 'Campo obrigatório';
    } else if (!regex.hasMatch(phone)) {
      res['result'] = false;
      res['message'] = 'Digite um numero válido';
    }

    return res;
  }
}
