import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/widgets.dart';
import 'package:flutter_application_2/ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 350),
        CardContainer(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text('Siga', style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 15),
            Text('Sistema de Pedidos',
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 10),
            Text('Login', style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 30),
            _LoginForm()
          ],
        )),
        SizedBox(height: 50),
        Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18)),
        SizedBox(height: 50),
      ]),
    )

            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   color: Colors.red,
            // ),
            ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hinText: '40221025725',
                labelText: 'Nombre de usuario',
                prefixIcon: Icons.alternate_email_sharp),
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hinText: '********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline),
          ),
          SizedBox(height: 50),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text('Ingresar', style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {}),
        ],
      )),
    );
  }
}
