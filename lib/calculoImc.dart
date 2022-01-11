// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculo extends StatefulWidget {
  const Calculo({ Key? key }) : super(key: key);

  @override
  _CalculoState createState() => _CalculoState();
}

class _CalculoState extends State<Calculo> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _texto = "informe seus dados";
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void limpar(){
     pesoController.text = "";
       alturaController.text = "";
    setState(() {      
      _texto = "Informe seus dados";
      _formKey =  GlobalKey<FormState>();
    });
   
  }

  void calcular (){
    setState(() {
      double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);
    if(imc < 18.6){
      _texto = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 18.6 && imc < 24.9){
      _texto = "Peso ideal(${imc.toStringAsPrecision(3)})";
    }else if (imc >= 24.9 && imc < 29.9){
      _texto = "acima do peso (${imc.toStringAsPrecision(3)})";
    }
    
    });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
        IconButton(onPressed: limpar,
         icon: const Icon(Icons.refresh)
         ),       
       ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  <Widget>[
          const Icon(Icons.person, size: 150, color: Colors.amber,),          
           TextFormField( keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Peso(KG)"),
              labelStyle: TextStyle(color: Colors.amber),
              ),    
               textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.amber,fontSize: 20),  
               validator: (value){
                if(value != null && value.isEmpty){
                  return "insira seu peso";
                }
              },    
              controller: pesoController,                    
          ),
           TextFormField( keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Altura (cm)"),
              labelStyle: TextStyle(color: Colors.amber)
              ),    
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.amber,fontSize: 20),  
              controller: alturaController,  
              validator: (value){
                if(value != null && value.isEmpty){
                  return "insira sua altura";
                }
              },    
          ),
         Padding(
           padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
           child: SizedBox(
           height: 50,
           child:  ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.amber),
            onPressed: () {
              if(_formKey.currentState!.validate()){
                calcular();
              }
            }  ,
           child:  const Text("Calcular", style: TextStyle(color: Colors.white),
           ),           
         ),   
        ),     
         ),
        Text(
         _texto,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.amber),
          )           
      ],
      ), )
      )
    );
  }
}