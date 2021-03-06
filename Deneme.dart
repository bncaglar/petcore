import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Deneme extends StatefulWidget {
  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    int buttonColor =0x8F0A2307;
    String dropdownValue = 'English';
    double deviseWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 90,
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 5),
                        child: Container(
                         width: MediaQuery.of(context).size.width,
                          alignment: Alignment.topLeft,
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white70,
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 10,
                            style: TextStyle(color: Colors.black54),
                            underline: Container(),
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                            items:<String> ['English', 'Turkish','Italian','French']
                            .map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(
                                  fontSize: 16),),
                              );
                            }).toList(),
                            )
                          ),
                      ),
                      Column(
                        children: [
                          Text("Petcore", style:
                            TextStyle(
                              color: Colors.black87,
                              fontSize: deviseWidth * .17,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: deviseWidth *.05,
                          ),
                          Container(
                            width: deviseWidth * .88,
                            height: deviseWidth * .15,
                            decoration: BoxDecoration(
                              color: Color(0xffd5f8de),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: deviseWidth * .043,
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.email_rounded),
                                      hintText: 'Email'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: deviseWidth * .04,),
                          Container(
                            width: deviseWidth * .88,
                            height: deviseWidth * .15,
                            decoration: BoxDecoration(
                              color: Color(0xffd5f8de),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Center(
                                child: TextField(
                                  obscureText:true,
                                  style: TextStyle(
                                    fontSize: deviseWidth * .043,
                                  ),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.lock_outline_rounded),
                                      hintText: 'Password'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: deviseWidth * .04,),
                            GestureDetector(
                              onTap: () async {
                                if(_formKey.currentState.validate()){
                                  _signinWithEmailPassword();
                                }
                              },
                              child: Container(
                                width: deviseWidth * .88,
                                height: deviseWidth * .15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color:Color(buttonColor),
                                ),

                                child: Center(
                                  child: Text(
                                    "Log In",style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: deviseWidth * .040,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: deviseWidth * .04,),
                            Container(
                              width: deviseWidth * .88,
                              child: GestureDetector(
                                onTap: (){

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Forgot Password?',
                                    style: TextStyle(
                                     fontSize: deviseWidth* .040,
                                      color: Color(0xffefe6e6),
                                      fontWeight: FontWeight.bold,
                                     ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          SizedBox(height: deviseWidth * .07,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height:1,
                                width: deviseWidth *.40,
                                color:Color(0xffefe6e6 ),
                              ),
                              SizedBox(width: 10,),
                              Text("OR",style: TextStyle(
                                fontSize: deviseWidth *.040,
                                color: Color(0xffefe6e6),
                              ),),
                              SizedBox(width: 10,),
                              Container(
                                height:1,
                                width: deviseWidth *.40,
                                color:Color(0xffefe6e6 ),
                              ),
                            ],
                          ),
                          SizedBox(height: deviseWidth * .06,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 1,
                                child: Image.asset('assets/facebook.png',
                                  height: deviseWidth* .060,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text("Login with Facebook",style: TextStyle(
                                fontSize: deviseWidth * .045,
                                color: Color(0xffefe6e6),
                              ),)
                            ],
                          ),
                          SizedBox(height: deviseWidth * .06,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 1,
                                child: Image.asset('assets/google.png',
                                  height: deviseWidth* .060,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("Login with Google",style: TextStyle(
                                fontSize: deviseWidth * .045,
                                color: Color(0xffefe6e6),
                              ),)
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: deviseWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Dont't have an account? ",
                              style: TextStyle(
                                color: Color(0xffefe6e6),
                                fontSize: deviseWidth * .040,
                              ),),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Text('Sign up',style: TextStyle(
                                  color: Color(0xff282828),
                                  fontSize: deviseWidth * .040,
                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                ],
             ),
           ),
         ),
      ),
    );
  }
}
//0x560A2307 açık
//0x8F0A2307 kapalı
