import 'package:flutter/material.dart';
import 'package:finend/auth/widgets/blue_button.dart';
import 'package:finend/auth/widgets/grey_button.dart';
import 'package:finend/auth/widgets/text_fields.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: const Color(0xFF0047FF),
                  child: const Image(
                    image: AssetImage('assets/images/finend.png'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40, bottom: 80),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Registre-se para ter\nacesso a aplicação",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF242424),
                            ),
                          ),
                          SizedBox(height: 64),
                          Text(
                            "Nome:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF242424),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 52,
                            child: CustomTextField(
                              inputHintText: "Insira seu nome aqui",
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            "E-mail:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF242424),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 52,
                            child: CustomTextField(
                                inputHintText: "Insira seu e-mail aqui"),
                          ),
                          SizedBox(height: 24),
                          Text(
                            "Senha:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF242424),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 52,
                            child: CustomTextField(
                                inputHintText: "Insira sua senha aqui"),
                          ),
                          SizedBox(height: 32),
                          AuthBlueButton(
                            buttonLabel: "Registrar-se",
                            pushToRoute: "/home",
                          ),
                          SizedBox(height: 16),
                          AuthGreyButton(
                            buttonLabel: "Login",
                            pushToRoute: "/login",
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
