// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


const request = "https://api.hgbrasil.com/finance/quotations?key=d835d4a8";

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}

class Conversor extends StatefulWidget {
  const Conversor({ Key? key }) : super(key: key);

  @override
  _Conversor createState() => _Conversor();
}

class _Conversor extends State<Conversor> {

  final realController = TextEditingController() ;
  final euroController = TextEditingController() ;
  final dolarController = TextEditingController() ;



   double? dolar;
   double? euro;

   void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

void _realChanged(String text){
  if(text.isEmpty){
    _clearAll();
  }
  double real = double.parse(text);
  dolarController.text = (real/dolar!).toStringAsFixed(2);
  euroController.text = (real/euro!).toStringAsFixed(2);

}
void _euroChanged(String text){
  if(text.isEmpty){
    _clearAll();
  }
    double euro = double.parse(text);
    realController.text = (euro * this.euro!).toStringAsFixed(2);
    dolarController.text = (euro * this.euro! / dolar!).toStringAsFixed(2);

}

void _dolarChanged(String text){
  if(text.isEmpty){
    _clearAll();
  }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar!).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar!/euro!).toStringAsFixed(2);

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de moedas"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder<Map>(
        
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text("Carregando Dados...", 
                  style: TextStyle(
                      color: Colors.red,
                      
                   ),
                   textAlign: TextAlign.center,
                  ),
                );
                default:
                if(snapshot.hasError){
                   return const Center(
                  child: Text("Erro ao carregar os dados", 
                  style: TextStyle(
                      color: Colors.red,
                      
                   ),
                   textAlign: TextAlign.center,
                  ),
                );
                } else {
                  dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children:   <Widget>[
                        const Icon(Icons.monetization_on, size: 150.0, color: Colors.red,),
                        const Divider(),
                        buildTextField("Reais", "R\$", realController, _realChanged),                      
                        const Divider(),
                        buildTextField("Dólares", "\$", dolarController, _dolarChanged),                        
                        const Divider(),
                        buildTextField("Euros", "€", euroController, _euroChanged)
                        
                      ],
                    ),
                  );
                }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, Function f){
    return  TextField(
        controller: c,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.red),
          border: const OutlineInputBorder(),
          prefixText: prefix,
          
        ),
        style: const TextStyle(
          color: Colors.red,                            
        ) ,
        keyboardType: TextInputType.number,
        onChanged: f as void Function(String)?,
    );
                        
}
  