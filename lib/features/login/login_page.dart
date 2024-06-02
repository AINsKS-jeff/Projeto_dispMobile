import 'package:cine_flix/features/home/pagina_filme.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/primary_button.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
       color: AppColors.deepBlue,
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem antes dos campos de email e senha
            SizedBox(
              width: 400, // Defina a largura desejada
              height: 400, // Defina a altura desejada
              child: Image.asset('assets/images/cine.png'),
            ),
            SizedBox(height: 20), // Adiciona um espaço entre a imagem e os campos
            // Campo de entrada de email
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.lightGrey,
              ),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            Divider(),
            // Campo de entrada de senha
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              style: AppTextStyles.smallText.copyWith(
                color: AppColors.lightGrey,
              ),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // Adiciona um espaço antes do botão de login
            // Botão de login
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Logar',
                 onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PaginaFilme()),
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}