import 'package:flutter/material.dart';
import 'package:aplicacao/contadorpessoas.dart';
import 'package:aplicacao/calculoImc.dart';


void main(){
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const SizedBox(height: 25),
          ElevatedButton(
            child: const Text("Contador de Pessoas"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contador()),
              );
            },
          ),
          const SizedBox(height: 25),
            ElevatedButton(
            child: const Text("Cálculo de IMC"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculo()),
              );
            },
          ),
        ],
        
      ),
    );
    
  }
}