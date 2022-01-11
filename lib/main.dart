import 'package:flutter/material.dart';
import 'package:aplicacao/contadorpessoas.dart';
import 'package:aplicacao/calculoImc.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:aplicacao/conversorDeMoedas.dart';



void main() async {

 
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage() 
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        
        title: const Text("Projetos"),        
      ),
     
      drawer: const Drawer(),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.start ,
        children: [
          
          ElevatedButton(
            child: const Text("Contador de Pessoas"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contador()),
              );
            },
          ),
     
        ElevatedButton(
            child: const Text("Cálculo de IMC"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculo()),
              );
            },
          ),
          
         
            
                
               ElevatedButton(
             child: const Text("Conversor de moedas"),
               onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Conversor()),
              );
            },
              
            )
              ],
           
            
            
            
          
                
           
        
        
        
      ),
    );
    
  }
}