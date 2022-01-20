import 'package:flutter/material.dart';
import 'package:aplicacao/contadorpessoas.dart';
import 'package:aplicacao/calculoImc.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:aplicacao/conversorDeMoedas.dart';
import 'package:aplicacao/ToDo.dart';



void main() async {

 
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage() 
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(        
        title: const Text("Projetos"),        
      ),
     
      drawer: const Drawer(),
      body: Center(
        child: Wrap(
        
       runSpacing: 15.0,
        children: [
           
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
               fixedSize: const Size(200, 60),
            ),
            child: const Text("Contador de Pessoas"),            
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contador()),
              );
            },
          ),
     
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
               fixedSize: const Size(200, 60),
            ),
            child: const Text("Cálculo de IMC"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculo()),
              );
            },
          ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
               fixedSize: const Size(200, 60),
            ),
            child: const Text("Conversor de moedas"),
              onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Conversor()),
            );
          },
         ),
        
         ElevatedButton(
           style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
              fixedSize: const Size(200, 60),
            ),
            child: const Text("Lista de tarefas"),
              onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Todo ()),
            );
          },
         ),

        ],
      ),
      )
    );
    
  }
  
}