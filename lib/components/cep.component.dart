import 'package:flutter/material.dart';
import 'package:sqlite_pdf/controllers/cep.component.controller.dart';
import 'package:sqlite_pdf/controllers/search.screen.controller.dart';
import 'package:sqlite_pdf/models/cep.model.dart';

class CepComponent extends StatelessWidget {

  CepComponentController _controller;
  
  CepModel _cepModel;
  
  bool _expand;
  bool _isAdd;

  BuildContext _contextP;

  CepComponent(
    this._contextP,{
    @required CepModel cepModel,
    @required bool initicalExpand,
    @required bool isAdd,
    @required var loadController
  }){
    this._cepModel = cepModel;
    this._expand = initicalExpand;
    this._isAdd = isAdd;

    _controller = CepComponentController(loadController);
  }

  Widget cabecalho(setState) => Row(
    children: [
      Expanded(
        flex: 80,
        child: Text(
          '${_cepModel.cep}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      Expanded(
        flex: 20,
        child: IconButton(
          icon: Icon( !_expand ? Icons.arrow_drop_down : Icons.arrow_drop_up),
          onPressed: () => setState(() => _expand = !_expand),
        ),
      )
    ],
  );

  Widget detalhe({
    @required String title,
    @required String subtitle,
  }) => Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        SizedBox(height: 2,),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StatefulBuilder(
          builder: (c, setState) => AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            crossFadeState: _expand ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: cabecalho(setState),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                cabecalho(setState),
                Container(
                  width: double.infinity, 
                  child: Divider(
                    height: 0,
                    color: Colors.white70,
                  )
                ),
                detalhe(
                  title: 'Logradouro', 
                  subtitle: '${_cepModel.logradouro}'
                ),
                detalhe(
                  title: 'Bairro', 
                  subtitle: '${_cepModel.bairro}'
                ),
                detalhe(
                  title: 'Localidade', 
                  subtitle: '${_cepModel.localidade}'
                ),
                detalhe(
                  title: 'UF', 
                  subtitle: '${_cepModel.uf}'
                ),
                Center(
                  child: _isAdd ? FlatButton.icon(
                    onPressed: () => _controller.addCep(_contextP ,cepModel: _cepModel),
                    icon: Icon(Icons.add),
                    label: Text(
                      'cadastrar cep'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                  ) : FlatButton.icon(
                    onPressed: () => _controller.deleteCep(_contextP, cepModel: _cepModel),
                    icon: Icon(Icons.delete_outline),
                    label: Text(
                      'Remover cep'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
