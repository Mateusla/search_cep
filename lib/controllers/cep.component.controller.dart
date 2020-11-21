import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sqlite_pdf/models/cep.model.dart';
import 'package:sqlite_pdf/services/cep.service.dart';
import 'package:sqlite_pdf/utils/dialogs.util.dart';

class CepComponentController {
  
  CepService _cepService = CepService();

  var _searchScreenController;

  CepComponentController(this._searchScreenController);

  Future addCep(BuildContext context, {@required CepModel cepModel}) async{
    _searchScreenController.setState((){
      _searchScreenController.load = true;
    });

    try{
      await _cepService.insertCep(cepModel);

      _searchScreenController.setState((){
        _searchScreenController.load = false;
      });

      await Future.delayed(Duration(milliseconds: 300));

      Dialogs.sucesso(context, mensagem: 'Cep cadastrado com sucesso!');

    }catch(erro){
      _searchScreenController.setState((){
        _searchScreenController.load = false;
      });

      if(erro.toString().contains('UNIQUE constraint failed'))
        Dialogs.erro(context , mensagem: 'Ops, cep já cadastrado!');
      else
        Dialogs.erro(context , mensagem: 'Ops, algo de errado não está certo!');
    }
  }

  Future deleteCep(BuildContext context, {@required CepModel cepModel}) async{
    _searchScreenController.setState((){
      _searchScreenController.load = true;
    });

    try{
      
      await _cepService.deleteCep(cepModel.cep);
      //_searchScreenController.meusCeps.removeWhere((element) => element.cep == cepModel.cep);
      await _searchScreenController.getCeps();
      
      _searchScreenController.setState((){
        _searchScreenController.load = false;
      });
    
    }catch(erro){
      _searchScreenController.setState((){
        _searchScreenController.load = false;
      });

      await Dialogs.erro(context , mensagem: 'Ops, algo de errado não está certo!');
    }
  }
}
