

// ignore_for_file: file_names

import 'package:flutter/material.dart';


class Contador extends StatefulWidget {
  const Contador({ Key? key }) : super(key: key);

  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  
  int count = 0;

  void decrementar() {
    setState(() {
        count--;
    });
  
  }
  void incrementar() {
     setState(() {
        count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de pessoas"),
      ),      
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:   [
       Text(
        isFull ? 'Lotado' : "Pode Entrar!",
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
        
        
      ),             
       Text( 
        "$count",
        style:  TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 60,
          color: isFull ? Colors.red : Colors.black
        ),
      ),
      const SizedBox(height: 10,),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [               
           TextButton(onPressed: isEmpty ? null : decrementar,
           child: const Text("SAIU!"),
           style: TextButton.styleFrom(
             backgroundColor: isEmpty ? Colors.red.withOpacity(0.2) : Colors.red,
             padding: const EdgeInsets.all(10),
             fixedSize: const Size(75, 45),
             primary: Colors.white,
             shape:  RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(24)
             )
           ),
            
           ),
           const SizedBox(width: 64,),
           
            TextButton(onPressed: isFull ? null : incrementar,
             child: const Text("ENTROU!"),
             style: TextButton.styleFrom(                   
               backgroundColor: isFull ? Colors.lightGreen.withOpacity(0.5) : Colors.lightGreen,
               fixedSize: const Size(75, 45),
               primary: Colors.white ,
               shape:  RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(24)
             )
             ),
             ),
           
         ],
         
       )
        ],
      )
    );
    
  }
}


