import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dialogs {

  static Future<void> erro(BuildContext context, {@required String mensagem}) async{
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Erro',
          style: TextStyle(
            color: Colors.redAccent[700],
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          '$mensagem',
          style: TextStyle(
            color: Colors.white70
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            textColor: Colors.redAccent[700],
            child: Text('FECHAR'),
          )
        ],
      ),
    );
  }

  static Future<void> sucesso(BuildContext context, {@required String mensagem}) async{
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Muito bem',
          style: TextStyle(
            color: Colors.greenAccent[700],
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          '$mensagem',
          style: TextStyle(
            color: Colors.white70
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            textColor: Colors.greenAccent[700],
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
