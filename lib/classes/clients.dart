class Client {
  String cuenta;
  String cliente;
  String descuento;
  String rncCedula;
  Client(
      {required this.cuenta,
      required this.cliente,
      required this.descuento,
      required this.rncCedula});

  static List<Client> getClients() {
    return <Client>[
      Client(
          cuenta: '22500059625',
          cliente: '250 CC (Villa Mella)',
          descuento: '20%',
          rncCedula: '22500059625'),
      Client(
          cuenta: '10097364',
          cliente: '4Ta. Racing (Ens. Luperon)',
          descuento: '25%',
          rncCedula: '00100957364'),
      Client(
          cuenta: '3400400507',
          cliente: 'A & J (Mao)',
          descuento: '25%',
          rncCedula: '03400400507'),
      Client(
          cuenta: '2800141596',
          cliente: 'A y D (Higuey)',
          descuento: '25%',
          rncCedula: '02800141596	'),
      Client(
          cuenta: '6800520550',
          cliente: 'A y D (Villa Altagracia, La cuchilla)',
          descuento: '25%',
          rncCedula: '06800520550'),
      Client(
          cuenta: '109941047',
          cliente: 'A y F (Ciudad)',
          descuento: '20%',
          rncCedula: '0109941047'),
      Client(
          cuenta: '114957335',
          cliente: 'A Y J  ( Ens. Quisqueya)',
          descuento: '20%',
          rncCedula: '00114957335'),
      Client(
          cuenta: '22900273818',
          cliente: 'A y J Motors (Los Alcarrizos)',
          descuento: '25%',
          rncCedula: '22900273818'),
      Client(
          cuenta: '3103738047',
          cliente: 'A y J Motors (Santiago)',
          descuento: '25%',
          rncCedula: '03103738047'),
      Client(
          cuenta: '118000264671',
          cliente: 'A Y M ( Piedra Blanca)',
          descuento: '25%',
          rncCedula: '11800138791'),
      Client(
          cuenta: '6100272175',
          cliente: 'A y R (Gaspar Hernandez)',
          descuento: '25%',
          rncCedula: '06100272175'),
      Client(
          cuenta: '3103082552',
          cliente: 'Abel Racing (Santiago)',
          descuento: '25%',
          rncCedula: '03103082001'),
      Client(
          cuenta: '4701365902',
          cliente: 'Abreu & Duran C X A (Moca)',
          descuento: '25%',
          rncCedula: '04701365902'),
      Client(
          cuenta: '4700750260',
          cliente: 'Abreu (Cabullas)',
          descuento: '25%',
          rncCedula: '04700750260'),
      Client(
          cuenta: '4900560642',
          cliente: 'Abreu (Cotui)',
          descuento: '20%',
          rncCedula: '4900560642'),
      Client(
          cuenta: '4400167070',
          cliente: 'Abreu (Dajabon)',
          descuento: '25%',
          rncCedula: '4400167070'),
      Client(
          cuenta: '8700155800',
          cliente: 'Abreu (Fantino)',
          descuento: '25%',
          rncCedula: '08700155800'),
      Client(
          cuenta: '2300674377',
          cliente: 'Abreu (Jarabacoa)',
          descuento: '25%',
          rncCedula: '02300674377'),
      Client(
          cuenta: '49005606421',
          cliente: 'Abreu II (Cotui)',
          descuento: '20%',
          rncCedula: '04900560642'),
      Client(
          cuenta: '40220156091',
          cliente: 'Acevedo (San Cristobal)',
          descuento: '25%',
          rncCedula: '40220156091'),
      Client(
          cuenta: '3100312820',
          cliente: 'Adaliah Mocead, SRL (Moca)',
          descuento: '25%',
          rncCedula: '130901635'),
      Client(
          cuenta: '105349799',
          cliente: 'Adonay (Nagua)',
          descuento: '25%',
          rncCedula: '00105349799	'),
      Client(
          cuenta: '4400257467',
          cliente: 'Adrian (Dajabon)',
          descuento: '25%',
          rncCedula: '04400257467'),
      Client(
          cuenta: '370088757',
          cliente: 'Adrian (Puerto Plata)',
          descuento: '25%',
          rncCedula: '03700887957'),
      Client(
          cuenta: '108030040',
          cliente: 'Adrian Motors (Herrera)',
          descuento: '25%',
          rncCedula: '00108030040'),
      Client(
          cuenta: '3800012968',
          cliente: 'Adriana (La Marginal)',
          descuento: '20%',
          rncCedula: '003800012968'),
      Client(
          cuenta: '106244353',
          cliente: 'Afri (Villa Juana)',
          descuento: '20%',
          rncCedula: '00106244353'),
      Client(
          cuenta: '130710333',
          cliente: 'Ag Blanco Import ( La Vega)',
          descuento: '25%',
          rncCedula: '130710333'),
      Client(
          cuenta: '7900169140',
          cliente: 'Agro Quimica (Vicente Noble)',
          descuento: '20%',
          rncCedula: '07900169140'),
      Client(
          cuenta: '3010256376',
          cliente: 'Aguas Vivas (Bani)',
          descuento: '25%',
          rncCedula: '003010256376'),
      Client(
          cuenta: '8700183257',
          cliente: 'Aguasvivas (Fantino)',
          descuento: '25%',
          rncCedula: '08700183257'),
      Client(
          cuenta: '4400252138',
          cliente: 'AJ Rep. y Ferreteria SRL (Dajabon)',
          descuento: '25%',
          rncCedula: '132520612'),
      Client(
          cuenta: '40212675322',
          cliente: 'AJR (La Cuchilla, Villa Altagracia)',
          descuento: '20%',
          rncCedula: '40212675322'),
      Client(
          cuenta: '1800259986',
          cliente: 'Albania (Barahona)',
          descuento: '20%',
          rncCedula: '01800259986')
    ];
  }

  // String CuentaCliente;
  // String Nombre;
  // String Telefono;
  // String Descuento;
  // String ZonaVentas;
  // String TipoNCF;
  // String RNC_Cedula;
  // String MotodoEntrega;

}
