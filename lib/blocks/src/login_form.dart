import 'package:contact_app/components/components.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  Future<void> handleLogin() async {
    if (usernameInputController.text.isEmpty ||
        passwordInputController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Todos os campos são obrigatórios.',
          ),
        ),
      );
      return;
    }

    print('função de login');
    // await userRepository
    //     .login(
    //         username: usernameInputController.text,
    //         password: passwordInputController.text)
    //     .then((_) => navigator(context: context, to: '/dashboard'))
    //     .catchError((e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text(
    //         'Nome de usuário e/ou senha incorreto(s)',
    //       ),
    //     ),
    //   );
    // });
  }

  @override
  void initState() {
    // userRepository = UserRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextInput(
            controller: usernameInputController,
            placeholder: 'Digite seu usuário',
            icon: Icons.person,
            label: 'Usuário',
          ),
          separator(height: 16),
          TextInput(
            controller: passwordInputController,
            placeholder: 'Digite sua senha',
            icon: Icons.lock,
            label: 'Senha',
            isPassword: true,
          ),
          separator(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: TXTButton(
                    text: 'Entrar',
                    textSize: 24,
                    action: () async {
                      await handleLogin();
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
