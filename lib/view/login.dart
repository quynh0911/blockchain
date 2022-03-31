import 'package:ducmn/view/sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezart/tezart.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mnemonicController = TextEditingController();
  Keystore? _keystore;
  @override
  void dispose() {
    _passwordController.dispose();
    _mnemonicController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              child: TextField(
                controller: _passwordController,
              ),
            ),
            const Padding(
                child: Text(
                  'Mnemonic',
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              child: TextField(
                controller: _mnemonicController,
              ),
            ),
            ElevatedButton(onPressed: (){
              _login();
            }, child:const Text('OK'))
          ]),
    );
  }
  _login() {
    _keystore = Keystore.fromMnemonic(_mnemonicController.text, password: _passwordController.text);
    showCupertinoModalPopup(context: context, builder: (_){
      return SignScreen(
        keystore: _keystore!,
      );
    });
  }
}
