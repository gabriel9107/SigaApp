import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/customer_list.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/products_screen.dart';
import 'package:flutter_application_2/screens/user_scren.dart';

class NavigationDrawer extends StatelessWidget {
  // const NavigationDrawer({Key? key}) : super(key: key)

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ])),
      );

  Widget buildHeader(BuildContext context) => Material(
      // Container(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserPage(),
          ));
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C5603AQFi7E4ddF3_pQ/profile-displayphoto-shrink_200_200/0/1516449677675?e=2147483647&v=beta&t=7GNpJdPJoCaIq3B-dPcdspAYvazBLSDndpzw5--W-hM'),
              ),
              SizedBox(height: 12),
              Text(
                'Gabriel Montero ',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              Text(
                '40221025725',
                style: TextStyle(fontSize: 28, color: Colors.white),
              )
            ],
          ),
        ),
      ));

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24), //espacio del padding
      child: Wrap(
        runSpacing: 16, //espacio entre ellos
        children: [
          ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ))),
          ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Clientes'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CustomerList(),
                  ))),
          ListTile(
            leading: const Icon(Icons.point_of_sale_sharp),
            title: const Text('Pedidos de Venta'),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text('Productos'),
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ProductsList(),
                  ))),
          ListTile(
            leading: const Icon(Icons.padding_outlined),
            title: const Text('Reporte'),
            onTap: () {},
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Exportar Cobros'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notificaciones'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text('Salir'),
            onTap: () {},
          ),
        ],
      ));
}
