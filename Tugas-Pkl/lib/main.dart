import 'package:flutter/material.dart';

void main(){
    runApp(MyApp());
}
class MyApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) => MaterialApp(debugShowCheckedModeBanner: false,
    theme:ThemeData(primarySwatch:Colors.blue),
    home:Scaffold(
        body:LSimpleCalculator(),
    ),
    );
}
class LSimpleCalculator extends StatefulWidget{
    @override
    State createState() => LSimpleCalculatorState();
}

class LSimpleCalculatorState extends State<LSimpleCalculator>{
    var num1 = 0,num2 = 0,ans = 0;

    final TextEditingController firstNumber = TextEditingController(text:"");
    final TextEditingController secondNumber = TextEditingController(text:"");

    bool checkNumbers(){
        try {
            num1 = int.parse(firstNumber.text);
            num2 = int.parse(secondNumber.text);

            return true;
        }catch (e){
            Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Invalid Number"),
            ));
            setState(() {
                ans = 0;
            });
            return false;
        }
    }
    void add(){
        if (checkNumbers())
        setState((){
            ans = num1 + num2;
        });
    }
    void subtract(){
        if (checkNumbers())
        setState((){
            ans = num1 - num2;
        });
    }
    void multiply(){
        if (checkNumbers())
        setState((){
            ans = num1 * num2;
        });
    }
    void division(){
        if (checkNumbers())
        setState((){
            try{
                ans = num1 ~/ num2;
            } catch(e){
                ans = 0;
            }
        });
    }
    void doClear(){
        setState((){
            firstNumber.text = "";
            secondNumber.text = "";
            ans = 0;
        });
    }

    @override
    Widget build(BuildContext context){
        return SingleChildScrollView(
            child : Container(
                padding : const EdgeInsets.all(40.0),
                child : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                        TextField(
                            keyboardType:TextInputType.number,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(),
                                hintText:'Masukan Angka Pertama',
                            ),
                            controller:firstNumber,
                        ),
                        SizedBox(
                            height:30,
                        ),
                        TextField(
                            style:TextStyle(),
                            keyboardType:TextInputType.number,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(),
                                hintText:'Masukan Angka Kedua',
                            ),
                            controller:secondNumber,
                        ),
                        SizedBox(
                            height:30,
                        ),
                        Text(
                            "Hasil : $ans",
                            style:TextStyle(
                                fontSize:18.0,
                                fontWeight:FontWeight.bold,
                            ),
                        ),
                        SizedBox(
                            height:20,
                        ),
                        Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children:<Widget>[
                                RaisedButton(
                                    child:Text(
                                        '+',
                                        style:TextStyle(
                                            fontSize:16.0,
                                            fontWeight:FontWeight.bold,
                                        ),
                                    ),
                                    onPressed:add,
                                ),
                                RaisedButton(
                                    child:Text(
                                        '-',
                                        style:TextStyle(
                                            fontSize:16.0,
                                            fontWeight:FontWeight.bold,
                                        ),
                                    ),
                                    onPressed:subtract,
                                ),
                            ],
                        ),
                        SizedBox(
                            height:16,
                        ),
                        Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children:<Widget>[
                                RaisedButton(
                                    child:Text(
                                        '*',
                                        style:TextStyle(
                                            fontSize:16.0,
                                            fontWeight:FontWeight.bold,
                                        ),
                                    ),
                                    onPressed:multiply,
                                ),
                                RaisedButton(
                                    child:Text(
                                        '/',
                                        style:TextStyle(
                                            fontSize:16.0,
                                            fontWeight:FontWeight.bold,
                                        ),
                                    ),
                                    onPressed:division,
                                ),
                            ],
                        ),
                        SizedBox(
                            height:16,
                        ),
                        Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children:<Widget>[
                                MaterialButton(
                                    child:Text(
                                        'Clear',
                                        style:TextStyle(
                                            fontSize:16.0,
                                            fontWeight:FontWeight.bold,
                                        ),
                                    ),
                                    color:Colors.blue,
                                    onPressed:doClear,
                                ),
                            ],
                        )
                    ],
                ),
            ),
        );
    }
}