//Eliminar la busqueda
import 'package:flutter/material.dart';

import '../classes/clients.dart';

class MySearchDelegateforProducto extends SearchDelegate {
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
          title: Text('Cliente: ' + suggestion.cliente),
          subtitle: Text('Costo : ' + suggestion.descuento),

          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.production_quantity_limits)),
              Container(
                width: 100,
                child: TextField(
                  decoration: InputDecoration(hintText: 'Cantidad'),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () {
                    print('cretae');
                  },
                  child: Text('Agregar'),
                ),
              )
            ],
          ),

          // Icon(Icons.add),
          onTap: () {
            query = suggestion.cliente;
          },
        );
      },
    );
  }
}
