import 'package:flutter/foundation.dart';
import 'package:sqlite_pdf/models/cep.model.dart';
import 'package:sqlite_pdf/services/search-cep.service.dart';

class SearchScreenController {

  Function setState;
  SearchCep searchCep;
  CepModel cepModel;

  String cep;
  bool load = false;

  SearchScreenController({@required this.setState});

  void changeCep(String value) => setState(() => cep = value.trim());

  String erroCep(){
    if(cep != null && cep.length<8)
      return 'Cep inválido';
    
    return null;
  }

  void search() async{
    searchCep = SearchCep();

    setState(() => load = true);

    try{
      cepModel = await searchCep.search(cep: cep);
      setState(() => load = false);
    }catch(err){
      cepModel = null;

      setState(() => load = false);
    }
  }
}
