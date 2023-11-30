import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SVAR - Hospedagens'),
        ),
        body: ListView(
          children: [
            Destino("Angra dos Reis", "imagens/angra.jpeg", 384, 70),
            Destino("Arraial do Cabo", "imagens/arraial.jpeg", 571, 65),
            Destino("Florianopólis", "imagens/chile.jpeg", 348, 85),
            Destino("Jericoacoara", "imagens/florianopolis.jpeg", 571, 75),
            Destino("Chile", "imagens/jericoacoara.jpeg", 446, 95),
            Destino("Madrid", "imagens/lasvegas.jpeg", 401, 85),
            Destino("Paris", "imagens/madrid.jpeg", 546, 95),
            Destino("Roma", "imagens/orlando.jpeg", 478, 85),
            Destino("Orlando", "imagens/paris.jpeg", 616, 105),
            Destino("Las Vegas", "imagens/roma.jpeg", 504, 110),
          ],
        ),
      ),
    );
  }
}

class Destino extends StatefulWidget{
  final String nome;
  final String img;
  final int valord;
  final int valorp;

  const Destino(this.nome,this.img,this.valord,this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_pessoas=0;
  int n_dias=0;
  int total=0;

  void dias(){
    setState(() {
      n_dias++;
      print("Contagem $n_dias");
        print(n_dias);
    });
   
  }

  void pessoas(){
    setState(() {
      n_pessoas++;
      print("Contagem $n_pessoas");
      print( n_pessoas);

    });
    
  }

  void calcular(){
    setState(() {
      total= (n_dias*widget.valord)+(n_pessoas*widget.valorp);
      print("Contagem $total");
      print( total);
  });
  }
  void limpar(){
    setState(() {
      n_dias = 0;
      n_pessoas = 0;
      total = 0;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.deepOrange,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            widget.nome,
            style: TextStyle(fontSize: 30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("R\$ ${widget.valorp}/pessoa - R\$ ${widget.valord}/dia",
              style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantidade de dias: $n_dias", style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed:
                dias,
                child: Icon(Icons.add)),
              //ElevatedButton(onPressed: limpar, child: Text("Limpar")),
            ],              
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantidade de pessoas: $n_pessoas", style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed:
                pessoas,
                child: Icon(Icons.add)),
              //ElevatedButton(onPressed: limpar, child: Text("Limpar")),
            ],              
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Valor total R\$: $total", style: TextStyle(fontSize: 20),),
              //ElevatedButton(onPressed: limpar, child: Text("Limpar")),
            ],              
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: 
              calcular, child: Text("Calcular")),
                
                
              Text("Valor total: $total", style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: limpar, child: Text("Limpar")),
            ],              
          ),

        ],
      ), );
  }

}
