import 'package:flutter/foundation.dart';
import 'package:sqlite_pdf/models/cep.model.dart';
import 'package:sqlite_pdf/services/cep.service.dart';

class MyCepsScreenController {

  List<CepModel> meusCeps = [];
  bool load = true;

  Function setState;

  MyCepsScreenController({@required this.setState});

  Future getCeps() async{
    
    CepService service = CepService();

    meusCeps.clear();
    var data = await service.getAll();
    print(data);
    if(data != null){
      data.forEach((e){
        meusCeps.add(CepModel.fromJson(e));
      });
    }
  }
}
