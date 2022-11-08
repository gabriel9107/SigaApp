import 'package:flutter/material.dart';

import 'nav_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Siga Mobile'),
          backgroundColor: Color.fromARGB(255, 25, 28, 228),
        ),
        drawer: NavigationDrawer(),
        body: Center(
          child: Text('espacio de prueba '),
        ),
      );
}

 
//   Widget build(BuildContext context) 
//   {
//     return Scaffold(
//       body: Center(
//         child: Text('Hola mundo'),
//       ),
//     );
//   }
// }
