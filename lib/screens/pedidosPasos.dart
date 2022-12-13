import 'package:flutter/material.dart';

import 'package:flutter_application_2/screens/nav_screen.dart';

class PedidosPasos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(' SigaApp - Pedidos'),
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
    // final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
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
                          child: SizedBox(
                        child: MiPedidos(),
                      )),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              width: 350,
                              child: autocompleteProducto(),
                              // MyTextFormField(hintText: 'Producto'),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 130,
                              child: MyTextFormField(hintText: 'Cantidad'),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 130,
                              child: ElevatedButton(
                                child: Text('Agregar'),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
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

class autocompleteProducto extends StatelessWidget {
  const autocompleteProducto({super.key});

  static const List<String> _kOptions = <String>[
    'Tv',
    'Abanico',
    'Telefono',
    'Pantalla'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
