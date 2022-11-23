import 'package:flutter/material.dart';

import '../classes/customer.dart';
import '../provider/db_helper.dart';
import 'customer_list.dart';

// ignore: must_be_immutable
class NewClient extends StatelessWidget {
  //Titulo del App bar en caso de que se edite o que se agregue un nuevo registro.
  String AppBarTitle;

  NewClient(this.AppBarTitle);

  // const NewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.AppBarTitle),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  // const MyCustomForm({super.key});

  final customerCodeController = TextEditingController();
  final customerNameController = TextEditingController();
  final customerDirController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: customerCodeController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'RNC',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: customerNameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nombre Cliente',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: customerDirController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Direccion',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: phone1Controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Telefono',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: phone2Controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Celular ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Descuento',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: commentController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Comentario',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.5, bottom: 15.5),
          child: Row(children: <Widget>[
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () async {
                await DatabaseHelper.instance.Add(Customers(
                    CustomerCode: customerCodeController.text,
                    CustomerName: customerNameController.text,
                    CustomerDir: customerDirController.text,
                    Phone1: phone1Controller.text,
                    Phone2: phone2Controller.text,
                    Comment1: commentController.text));

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerList()));
              },
              style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            ElevatedButton(
              child: Text('Cancelar'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            )
          ]),
        ),
      ],
    );
  }
}
