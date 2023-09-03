import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xo/home_Screen.dart';


// ignore: camel_case_types
class Home_UI extends StatefulWidget {
  const Home_UI({super.key});

  @override
  State<Home_UI> createState() => _Home_UIState();
}

// ignore: camel_case_types
class _Home_UIState extends State<Home_UI> {
final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
final TextEditingController players1 = TextEditingController();
final TextEditingController players2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:const Color.fromARGB(255, 202, 200, 190),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors:[Color.fromARGB(255, 150, 166, 194), Color.fromARGB(179, 225, 180, 180)])),
        child: Form(
          key:_formKey ,
          child: Column(
            children: [
              ShaderMask(
        shaderCallback: (rect) =>
          LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: <Color>[Color.fromARGB(255, 19, 209, 92), Colors.deepOrange.shade900],
        tileMode: TileMode.mirror,
          ).createShader(rect),
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text("Enter Player Name",
                // Rubik Iso
                style:GoogleFonts.rubikIso(
                    fontSize: 29,color: Colors.white),
                    
                    
                      ),
              ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 100,right: 50),
                child: TextFormField(
                    
                  controller: players1,
                  style:const TextStyle(color: Colors.brown),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),  
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 255, 0, 0))),
                    hintText: "Player 1",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                    icon: Icon(Icons.account_circle_outlined,color: Colors.blueGrey,)
                    
                    
                  ),
                    validator:(value){
                      if (value == null || value.isEmpty){
                        return "Enter Player Name 1";
                      }
                      return null;
                    }
                    
                ),
              ),
         Center(
           child: Padding(
             padding: const EdgeInsets.only(left: 100,right: 50),
             child: TextFormField(
                    controller: players2,
                    style:const TextStyle(color: Colors.brown),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),  
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.transparent)),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 190, 45, 45))),
                 hintText: "Player 2",
                 hintStyle: TextStyle(color: Colors.black),
                                     icon: Icon(Icons.account_circle_outlined, color:Colors.blueGrey,)

                 
                    ),
                 validator:(value){
                   if (value == null || value.isEmpty){
              return "Enter Player Name 2";
                   }
                   return null;
                 }
                 
                  ),
           ),
         ),
        SizedBox(height: 30),
        
        InkWell(
          onTap:(){
            if(_formKey.currentState!.validate()){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Game(player1: players1.text, player2: players2.text),));
            }
          },
          child: Container(
            width: 100,
            decoration:BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 177, 210, 225),Color.fromARGB(255, 232, 207, 170),Colors.lime,const Color.fromARGB(255, 181, 154, 163)]),
           borderRadius: BorderRadius.circular(10),
          ),
          child: Text("Continue", style: GoogleFonts.kaushanScript(
            fontSize: 20, 
          ),),
          )
        )
              ],
          ),
        ),
      ),
    ));
  }
}