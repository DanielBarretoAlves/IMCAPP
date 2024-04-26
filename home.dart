import 'package:flutter/material.dart';
import 'package:appimc/imc.dart';
import 'package:appimc/resultado.dart';

class HomeIMC extends StatefulWidget {
  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = IMC(altura: alt, peso: pes);

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IMCResultado(imc: myImc),
        ),
      );
    });
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcule seu IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparCampos,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Icon(
                  Icons.calculate_outlined,
                  color: Colors.blue,
                  size: 80.0,
                ),
              ),
              _buildTextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                labelText: 'Altura',
              ),
              _buildTextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                labelText: 'Peso',
              ),
              ElevatedButton(
                onPressed: _btnCalcularIMC,
                child: Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
