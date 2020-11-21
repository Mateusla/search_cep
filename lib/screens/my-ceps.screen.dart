import 'package:flutter/material.dart';
import 'package:sqlite_pdf/components/cep.component.dart';
import 'package:sqlite_pdf/controllers/my-ceps.screen.controller.dart';

class MyCepsScreen extends StatefulWidget {
  @override
  _MyCepsScreenState createState() => _MyCepsScreenState();
}

class _MyCepsScreenState extends State<MyCepsScreen> {

  MyCepsScreenController controller;

  Future getCeps() async{
    await controller.getCeps();

    setState(() {
      controller.load = false;
    });

    print(controller.meusCeps);
  }

  @override
  void initState() {
    super.initState();

    controller = MyCepsScreenController(setState: setState);
    getCeps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Ceps'),
      ),
      body: Column(
        children: [
          controller.load ? Theme(
            data: Theme.of(context).copyWith(accentColor: Theme.of(context).secondaryHeaderColor),
            child: LinearProgressIndicator(backgroundColor: Colors.white10,),
          ) : 
          Container(),
          controller.load ? Container() : 
          Expanded(
            child: controller.meusCeps.isEmpty ? 
            Center(
              child: Text(
                'Nenhum cep cadrastrado ainda.',
                style: TextStyle(
                  color: Colors.white70
                ),
              ),
            ) : RefreshIndicator(
              onRefresh: () async => await getCeps(),
              child: ListView.builder(
                itemCount: controller.meusCeps.length,
                itemBuilder: (context, index) => CepComponent(
                  context,
                  cepModel: controller.meusCeps[index],
                  loadController: controller,
                  initicalExpand: false,
                  isAdd: false,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
