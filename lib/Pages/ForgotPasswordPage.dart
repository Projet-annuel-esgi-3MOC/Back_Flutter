// forgot_password_page.dart
import 'package:back_web_pa_flutter/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  void onReturnClicked(BuildContext context) {
    GoRouter.of(context).go('/connexion');
  }

  void onSendClicked() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenApp,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 559,
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Modifier le mot de passe',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              'Veuillez saisir l\'adresse électronique de votre compte.\n'
                                  'Un email contenant les instructions afin de créer un nouveau mot de passe vous sera envoyé.',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ce champ est requis';
                                }
                                if (!value.contains('@') && !value.contains('.')) {
                                  return 'Veuillez entrer une adresse e-mail valide';
                                }
                                // Ajoutez d'autres validations si nécessaire
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Votre Email',
                              ),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => onReturnClicked(context),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: greenApp,
                                    size: 30,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: onSendClicked,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: greenApp,
                                    side: const BorderSide(color: greenApp, width: 2),
                                  ),
                                  child: const Text(
                                    'Envoyer',
                                    style: TextStyle(color: greenApp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
