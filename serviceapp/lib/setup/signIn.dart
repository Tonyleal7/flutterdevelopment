import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:serviceapp/pages/home.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  
 String _email, _password;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      //),
      body: Form( 
      key: _formkey,
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              

              child: Stack(
                children: <Widget> [
                  

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                        'Service',
                        style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold
                        )
                    ),
                    ),
                  
                    Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                        'App',
                        style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold
                        )
                    ),
                    ),
                    Container(
                    padding: EdgeInsets.fromLTRB(170.0, 175.0, 0.0, 0.0),
                    child: Text(
                        ':)',
                        style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.deepOrange
                        )
                    ),
                    ),
                ])
            ),
            Container(
               padding: EdgeInsets.only(top: 35.0,left:20.0, right:20.0),
               child: Column(children: <Widget>[
                 TextFormField(
                   validator:(input){

                   if(input.isEmpty)
                   {
                     return 'Please enter Valid Email';
                   }
                   },
                   onSaved: (input) => _email = input,
                   
                   decoration: InputDecoration(
                     labelText:'Email',
                     labelStyle: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.bold,
                       color: Colors.grey

                     )
                   )
                   ),
                   SizedBox(height: 20.0),
                   TextFormField(
                   validator: (input)
                   {
                     if(input.length < 6)
                     {
                       return 'Please enter a password';
                     }
                   },
                   onSaved: (input) => _password = input,
                   decoration: InputDecoration(
                     labelText:'Password',
                     labelStyle: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.bold,
                       color: Colors.grey

                     )
                   )
                   ),
                   SizedBox(height: 5.0),
                   Container(
                     //onPressed: (){},
                     alignment: Alignment(1.0,0.0),
                     padding: EdgeInsets.only(top:15.0,left:20.0),
                     child: InkWell(
                       child: Text('Forgot Password',
                       style: TextStyle(
                         color: Colors.deepOrange,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Monserrat',
                         decoration: TextDecoration.underline,
                       )
                       )
                     )
                   ),
                   SizedBox(height: 40),
                  Container(
                     height:40.0,
                     //onPressed: signIn,
                     child: Material(
                       borderRadius: BorderRadius.circular(20.0),
                       shadowColor: Colors.deepOrange,
                       color: Colors.deepOrange,
                       elevation: 7.0,
                       child: GestureDetector(
                         onTap: signIn,
                         child: Center(
                           child: Text(
                             'Login',
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Monserrat',
                             ),
                           )
                         )
                       )

                     )
                   ),
                   SizedBox(height:30),
                   Container(
                     height:40.0,
                     child: Material(
                       borderRadius: BorderRadius.circular(20.0),
                       shadowColor: Colors.deepOrange,
                       color: Colors.white,
                       elevation: 7.0,
                       child: GestureDetector(
                         onTap: (){},
                         child: Center(
                           child: Text(
                             'Register',
                             style: TextStyle(
                               color: Colors.deepOrange,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Monserrat',
                             ),
                           )
                         )
                       )

                     )
                   ),
                   
               ],
               )
            ),
          ],
        ),
      ),
    );

      
       // This trailing comma makes auto-formatting nicer for build methods.
    
  }
 Future<void> signIn ()
 async
 {
   final formState = _formkey.currentState;
   if (formState.validate())  

   {
      formState.save();
      try{
       FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
       //FirebaseUser user =  (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } catch(e){
          print(e.message);
      }
     
   }
 }
}
