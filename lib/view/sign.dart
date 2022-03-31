import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezart/tezart.dart';

class SignScreen extends StatefulWidget{
  final Keystore keystore;
  const SignScreen({Key? key, required this.keystore}) : super(key: key);

  @override
  _SignScreenState createState() {
    return _SignScreenState();
  }

}
class _SignScreenState extends State<SignScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Sign'),),
        body: SafeArea(
          child: Column(
          children: [
            Text(widget.keystore.address)
          ],
      ),
        ),
    );
  }

}