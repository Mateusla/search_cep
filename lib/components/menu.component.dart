import 'package:flutter/material.dart';

class MenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scrollbar(
        thickness: 4,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Search Ceps',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    ListTile(
                      onTap: () => Navigator.pushNamed(context, '/myceps'),
                      title: Text(
                        'Meus Ceps',
                        style: TextStyle(
                          color: Colors.white70
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Development by:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Mateus Lima Aguiar',
                    style: TextStyle(
                      color: Colors.white70
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    'Contact:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'mateusla.dev@gmail.com',
                    style: TextStyle(
                      color: Colors.white70
                    ),
                  ),
                  Text(
                    '(88) 99481 0066',
                    style: TextStyle(
                      color: Colors.white70
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
