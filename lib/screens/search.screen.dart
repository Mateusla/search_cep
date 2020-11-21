import 'package:flutter/material.dart';
import 'package:sqlite_pdf/components/cep.component.dart';
import 'package:sqlite_pdf/components/menu.component.dart';
import 'package:sqlite_pdf/controllers/search.screen.controller.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  SearchScreenController controller;
  var scaffoldKey;

  @override
  void initState() {
    super.initState();

    scaffoldKey = GlobalKey();
    controller = SearchScreenController(setState: setState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MenuComponent(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        child: SafeArea(
          child: Column(
            children: [
              Card(
                color: Theme.of(context).accentColor,
                elevation: 4,
                shadowColor: Colors.black,
                margin: EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          type: MaterialType.transparency,
                          shape: CircleBorder(),
                          child: IconButton(
                            icon: Icon(Icons.menu), 
                            onPressed: () => scaffoldKey.currentState.openDrawer(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: TextField(
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.search,
                          onChanged: controller.changeCep,
                          onSubmitted: (_) => controller.erroCep() == null && _.isNotEmpty && !controller.load ? controller.search() : null,
                          keyboardType: TextInputType.number,
                          maxLength: 8,
                          decoration: InputDecoration(
                            isDense: true,
                            isCollapsed: true,
                            counterText: '',
                            hintText: 'Buscar cep...',
                            hintStyle: TextStyle(color: Colors.white70),
                            errorStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            errorText: controller.erroCep()
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          type: MaterialType.transparency,
                          shape: CircleBorder(),
                          child: IconButton(
                            icon: Icon(Icons.search), 
                            onPressed: controller.erroCep() == null && controller.cep != null && !controller.load ? controller.search : null,
                          ),
                        ),
                      ),
                    ],
                  ),  
                ),
              ),
              !controller.load ? Container() : 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Theme.of(context).secondaryHeaderColor),
                  child: LinearProgressIndicator(backgroundColor: Colors.white10,),
                ),
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: controller.cepModel == null ? Center(
        child: Text(
          'Nenhuma cep encontrado!',
          style: TextStyle(
            color: Colors.white70
          ),
        ),
      ) : SingleChildScrollView(
        child: CepComponent(
          context,
          cepModel: controller.cepModel,
          loadController: controller,
          initicalExpand: true,
          isAdd: true,
        ),
      ),
    );
  }
}
