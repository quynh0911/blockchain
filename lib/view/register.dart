import 'package:ducmn/routes.dart';
import 'package:ducmn/view/sign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:tezart/tezart.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() {
    return _RegisterScreenState();
  }

}
class _RegisterScreenState extends State<RegisterScreen>{
  final TextEditingController _controller = TextEditingController();
  final String mnemonic = bip39.generateMnemonic(strength: 256);
  Keystore? keyStore;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(child: Text('Password', style: TextStyle(fontSize: 20),),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal:12),
            child: TextField(
              controller: _controller,
            ),
          ),
          const Padding(child: Text('Please remember this Mnemonic: ',
          style: TextStyle(fontSize: 20),),
              padding: EdgeInsets.all(15)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
            child: Text(mnemonic),
          ),
          ElevatedButton(onPressed: () async{
              await _register();
              openSign();
          }, child: const Text('OK'))
        ],
      ),
    );
  }
  _register() async{
   keyStore = Keystore.fromMnemonic(mnemonic, password: _controller.text);
    // final client = TezartClient('http://localhost:20000/');
    // final operationsList = await client.transferOperation(source: keyStore, amount: 10, destination:'');
//register
  }
  openSign(){
    showCupertinoModalPopup(context: context, builder: (_){
      return SignScreen(
        keystore: keyStore!,
      );
    });
  }
}