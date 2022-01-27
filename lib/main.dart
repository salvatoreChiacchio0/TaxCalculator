import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  State <StatefulWidget> createState(){
   return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  String _userInput = "";
  double _finalBalance = 0;
  int taxes = 0;
  bool _clicked= false;
  @override
  Widget build(BuildContext context){


    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calcolatore Malato'),
        ),
        body:Container(
          padding: const EdgeInsets.all((16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Inserisci importo"),
                TextField(
                 decoration: new InputDecoration(labelText: "Inserisci soldi"),
                   keyboardType: TextInputType.phone,
                 onChanged: (String text){
                   setState ((){
                     _userInput = text;
                   });
                 }),

               Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(right:15),
                     child:CustomButton("22",(){
                       setState(() {
                         taxes = 22;
                         CustomButton("22",null);
                       });
                     }),

                   ),
                   Container(
                     margin: EdgeInsets.only(right:15),
                     child: CustomButton("10",(){
                           setState(() {
                             taxes = 10;
                           });

                     }),
                   ),
                   Container(
                     margin: EdgeInsets.only(right:15),
                     child: CustomButton("4",(){
                           setState(() {
                             taxes = 4;
                           });

                     }),
                   ),

                 ],
               ),
                Text("Calcolo senza IVA $_userInput"),
               Text("IVA $taxes"),
               Text("Totale $_finalBalance"),

               Expanded(
                   child: Align(alignment: Alignment.bottomLeft,
                       child: Row(
                         children: [
                           Flexible(
                             fit: FlexFit.tight,
                             flex: 1,
                             child: ElevatedButton(
                                 onPressed: () {},
                                 child:CustomButton("Calcola IVA",(){
                                   setState(() {
                                     if(_userInput != null) {
                                        double input = double.parse(_userInput);
                                        print((input/100)*taxes);
                                       _finalBalance = input + (input/100)*taxes;

                                   }
                                   });
                                 })),
                           ),
]
                       )
                   )
               )
             ]
    ),
      ),
    ),
    );
  }

  double calculateTaxes(int importo,int fee){
    return importo - ((importo/100)*fee);
  }
}

class CustomButton extends StatelessWidget{
    String testo;
    Function()? onButtonPressed;
    CustomButton(this.testo,this.onButtonPressed);



    @override
    Widget build(BuildContext ctx){
      return Container(
        child:ElevatedButton(
          onPressed: onButtonPressed,child: Text("$testo%"),
        )
      );
    }
    changeState(int? value){
      return value;
    }
}