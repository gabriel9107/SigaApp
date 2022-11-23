import 'package:flutter/material.dart';
// import 'package:flutter_application_2/classes/clients.dart';
import 'package:flutter_application_2/classes/customer.dart';

import 'package:flutter_application_2/provider/db_helper.dart';
import 'package:flutter_application_2/screens/data_tabla.dart';
import 'package:flutter_application_2/screens/nav_screen.dart';
import 'package:flutter_application_2/screens/new_cliente.dart';

class CustomerList extends StatefulWidget {
  @override
  createState() => CustomerListState();
}

class CustomerListState extends State<CustomerList> {
  // late List<Client> Clients;
  int count = 0;

  @override
  void initState() {
    // Clients = Client.getClients();
    super.initState();
  }

  Widget build(BuildContext context) {
    // Clients.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text('Siga Mobile - Clientes'),
        backgroundColor: Color.fromARGB(255, 25, 28, 228),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                {showSearch(context: context, delegate: MySearchDelegate())},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewClient('Nuevo cliente')),
          );
        },
        tooltip: 'Agregar',
        child: Icon(Icons.add),
      ),
      body: Center(
        child: FutureBuilder<List<Customers>>(
          future: DatabaseHelper.instance.getCustomers(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Customers>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Cargando...'));
            }
            return snapshot.data!.isEmpty
                ? Center(child: Text('No existen clientes en el momento...'))
                : ListView(
                    children: snapshot.data!.map((customer) {
                      return Center(
                        child: ListTile(
                          title: Text(customer.CustomerName),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/classes/clients.dart';
// import 'package:flutter_application_2/screens/data_tabla.dart';
// import 'package:flutter_application_2/screens/nav_screen.dart';
// import 'package:flutter_application_2/screens/new_cliente.dart';

// class CustomerList extends StatefulWidget {
//   @override
//   createState() => CustomerListState();
// }

// class CustomerListState extends State<CustomerList> {
//   late List<Client> Clients;
//   int count = 0;

//   @override
//   void initState() {
//     Clients = Client.getClients();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     // Clients.sort();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Siga Mobile - Clientes'),
//         backgroundColor: Color.fromARGB(255, 25, 28, 228),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () =>
//                 {showSearch(context: context, delegate: MySearchDelegate())},
//           )
//         ],
//       ),
//       drawer: NavigationDrawer(),
//       body: Clients.length > 0
//           ? ListView.builder(
//               itemCount: Clients.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   color: Colors.white,
//                   elevation: 2.0,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.blue,
//                       child: Icon(Icons.emoji_people),
//                     ),
//                     title: Text(Clients[index].cuenta),
//                     subtitle:
//                         Text(Clients[index].cliente + ' | ' + 'Nicolas Ramon '),
//                     // Icono para la ediccion
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(
//                             Icons.point_of_sale,
//                           ),
//                           onPressed: () {
//                             //   _onDeleteItemPressed(index);
//                           },
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             Icons.edit,
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       NewClient('Editar Cliente')),
//                             );
//                           },
//                         ),
//                       ],
//                     ),

//                     // Icon(
//                     //   Icons.edit,
//                     //   color: Colors.grey,

//                     // ) ,

//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => NewClient('Editar Cliente')),
//                       );
//                       // NavigateDetail('Edit Product');
//                     },
//                   ),
//                 );
//               },
//             )
//           : Center(
//               child: Text('NO existen Productos'),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => NewClient('Nuevo Cliente')),
//           );

//           // NavigateDetail('Nuevo Producto');
//         },
//         tooltip: 'Add Product',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
