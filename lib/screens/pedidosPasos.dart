import 'package:flutter/material.dart';

import 'package:flutter_application_2/screens/nav_screen.dart';

class PedidosPasos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Siga Mobile - Pedidos'),
          backgroundColor: Color.fromARGB(255, 25, 28, 228)),
      drawer: NavigationDrawer(),
      body: MiPedidos(),
    );
  }
}

class MiPedidos extends StatefulWidget {
  @override
  State<MiPedidos> createState() => _MiPedidoState();
}

class _MiPedidoState extends State<MiPedidos> {
  int _currentstep = 0;

  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: Stepper(
            currentStep: _currentstep,
            type: StepperType.horizontal,
            physics: ScrollPhysics(),
            onStepTapped: (int Index) {
              setState(() {
                _currentstep = Index;
              });
            },
            onStepContinue: () {
              if (_currentstep != 2) {
                setState(() {
                  _currentstep += 1;
                  print(_currentstep);
                });
              }
            },
            //cuando se cancele
            onStepCancel: (() {
              if (_currentstep != 1) {
                setState(() {
                  _currentstep -= 1;
                });
              }
            }),
            steps: [
              Step(
                title: Text('Cliente'),
                content: Column(
                  children: [Text('Cliente '), TextFormField()],
                ),
                isActive: _currentstep >= 0,
                state:
                    _currentstep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                  title: Text('Productos'),
                  content: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              width: 450,
                              child: MyTextFormField(hintText: 'Producto'),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 200,
                              child: MyTextFormField(hintText: 'Cantidad'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  isActive: _currentstep >= 0,
                  state: _currentstep >= 1
                      ? StepState.complete
                      : StepState.disabled),
              Step(
                  title: Text('Resumen'),
                  content: Column(
                    children: [Text('Cliente '), TextFormField()],
                  ),
                  isActive: _currentstep >= 0,
                  state: _currentstep >= 2
                      ? StepState.complete
                      : StepState.disabled)
            ],
          ))
        ],
      )),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;

  MyTextFormField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
