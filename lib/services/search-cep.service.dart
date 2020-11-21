import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sqlite_pdf/models/cep.model.dart';

import 'package:http/http.dart' as http;

class SearchCep {

  Future<CepModel> search({@required String cep}) async{

    var response = await http.get('https://viacep.com.br/ws/$cep/json/');

    print(response.body);

    if(!response.body.contains('erro'))
      return CepModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return null;
  }
}
