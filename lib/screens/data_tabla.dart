import 'package:flutter/material.dart';
import 'package:flutter_application_2/classes/clients.dart';

import 'nav_screen.dart';
import 'new_cliente.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  late List<Client> Clients;
  @override
  void initState() {
    Clients = Client.getClients();
    super.initState();
  }

  DataTable DataBody() {
    return DataTable(
      columns: [
        DataColumn(
            label: Text(
              "Cuenta",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            numeric: true,
            tooltip: "This is First Name"),
        DataColumn(
            label: Text("Cliente"),
            numeric: true,
            tooltip: "This is Last Name"),
        DataColumn(
            label: Text('Descuento'),
            numeric: false,
            tooltip: 'El descuento del Cliente'),
        DataColumn(
            label: Text('Rnc_Cedula'),
            numeric: false,
            tooltip: 'El descuento del Cliente')
      ],
      rows: Clients.map(
        (clients) => DataRow(cells: [
          DataCell(
            Text(
              clients.cuenta,
            ),
          ),
          DataCell(
            Text(clients.cliente),
          ),
          DataCell(
            Text(clients.descuento),
          ),
          DataCell(
            Text(clients.rncCedula),
          ),
        ]),
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siga Mobile'),
        backgroundColor: Color.fromARGB(255, 25, 28, 228),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                {showSearch(context: context, delegate: MySearchDelegate())},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            // mainAxisSize: MainAxisSize.max,
            // verticalDirection: VerticalDirection.up,
            children: [
              Column(children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewClient()),
                    );
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                )
                // IconButton(

                //     onPressed: () => {},
                //     iconSize: 24,
                //     icon: Icon(Icons.add),
                //     color: Colors.blue[500]),
                // Icon(Icons.add_circle_outline_sharp, color: Colors.blue[500]),
                // Text('Agregar Cliente'),
              ]),
              // Column(children: [
              //   Icon(Icons.search, color: Colors.blue[500]),
              //   Text('Buscar Cliente')
              // ])
            ],
          ),
          Expanded(
            child: ListView(children: <Widget>[Center(child: DataBody())]),
          ),
        ],
      ),
    );
  }
}

//Eliminar la busqueda
class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            }),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        //Boton para regresar atras
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w300),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Client> suggestions = Client.getClients().where((element) {
      final result = element.cliente.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion.cliente),
          onTap: () {
            query = suggestion.cliente;
          },
        );
      },
    );
  }
}
