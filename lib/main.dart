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
  int taxes = 22;
  String? error;
  bool _clicked= false;

  onTaxChange(int value){
    setState(() {
      taxes = value;
    });
  }
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
                 decoration: new InputDecoration(
                     errorText: error,
                     labelText: "Inserisci soldi"),
                   keyboardType: TextInputType.phone,
                 onChanged: (String text){
                   setState ((){
                     error = (double.tryParse(text) == null) ?"Inserisci un numero":null;
                     _userInput = (double.tryParse(text) != null) ? text : "0";
                   });
                 }),

               Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(right:15),
                     child:CustomButton(CustomButton.LexuryTax,(){
                      onTaxChange(22);
                      },taxes == 22),
                    ),


                   Container(
                     margin: EdgeInsets.only(right:15),
                     child: CustomButton(CustomButton.FoodTax,(){
                       onTaxChange(10);
                     },taxes == 10),
                   ),
                   Container(
                     margin: EdgeInsets.only(right:15),
                     child: CustomButton(CustomButton.AgriTax,(){
                       onTaxChange(4);
                     },taxes == 4),
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
                                 },true)),
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
    static const String LexuryTax="22";
    static const String FoodTax="10";
    static const String AgriTax="4";

    String rate;
    Function()? onButtonPressed;
    bool enabled;
    CustomButton(this.rate,this.onButtonPressed,this.enabled);



    @override
    Widget build(BuildContext ctx){
      return Container(
        child:TextButton(
          style: _getStateStyle(),
          child:Text(rate,
          style: _getTextStyle(),),
          onPressed: onButtonPressed,
        )
      );
    }
    changeState(int? value){
      return value;
    }
    ButtonStyle _getStateStyle(){
      return TextButton.styleFrom(
        backgroundColor: enabled? Colors.blue : Colors.grey,
      );
    }

    TextStyle _getTextStyle(){
      return TextStyle(
        color:Colors.white,
      );
    }
}
class CalculateTaxesButton extends StatelessWidget{
  String text=" ";
  Function()? onButtonPressed;

  Widget build(BuildContext ctx){
    return Container(
        child:TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child:Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
          onPressed: onButtonPressed,
        )
    );
  }
}
