import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_pdf/models/cep.model.dart';

class CepService {

  static const String cepTable = 'CEP';
  static const String cep = 'cep';
  static const String logradouro = 'logradouro';
  static const String complemento = 'complemento';
  static const String bairro = 'bairro';
  static const String localidade = 'localidade';
  static const String uf = 'uf';
  static const String ibge = 'ibge';
  static const String gia = 'gia';
  static const String ddd = 'ddd';
  static const String siafi = 'siafi';

  static CepService _cepService;
  static Database _database;

  CepService._instance();

  factory CepService(){
    if(_cepService == null)
      _cepService = CepService._instance();

    return _cepService;
  }

  Future<Database> get database async {
    if(_database == null) _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}bairro.db';

    return await openDatabase(path, version: 1,  onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('CREATE TABLE $cepTable($cep TEXT PRIMARY KEY, '
      '$logradouro TEXT, $complemento TEXT, $bairro TEXT, $localidade TEXT, '
      '$uf  TEXT, $ibge TEXT, $gia TEXT, $ddd TEXT, $siafi TEXT)');
  }

  Future<int> insertCep(CepModel cep) async{
    Database db = await this.database;

    return db.insert(cepTable, cep.toJson());
  }

  Future<int> deleteCep(String cepId) async{
    Database db = await this.database;

    return db.delete(cepTable, where: '$cep = ?', whereArgs: [cepId]);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
     
     Database db = await this.database;

     return await db.query(cepTable,
      columns: [cep, logradouro, complemento, bairro, localidade, uf, ibge, gia, ddd, siafi],
     );
  } 
}
