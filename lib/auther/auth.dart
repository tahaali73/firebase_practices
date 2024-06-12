import 'package:fire5/functions/authfunction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authfire extends StatefulWidget {
  const authfire({super.key});

  @override
  State<authfire> createState() => _authfireState();
}

class _authfireState extends State<authfire> {
  final _formkey = GlobalKey<FormState>();
  bool islogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('authentication'),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !islogin? TextFormField(
              key: ValueKey('user name'),
              decoration: InputDecoration(hintText: "enter user name"),
              validator: (value){
                if(value.toString().length<3){
                  return 'username is so small';
                }else{
                  return null;
                }
              },
              onSaved: (value){
                setState(() {
                  username = value!;
                });
              },
            ) : Container(),
            TextFormField(
              key: ValueKey('email'),
              decoration: InputDecoration(hintText: "enter email"),
            validator: (value){
                if(!(value.toString().contains('@'))){
                  return 'Invalid Email';
                }else{
                  return null;
                }
            },
              onSaved: (value){
                setState(() {
                  email = value!;
                });
              },
            ),
        TextFormField(
          key: ValueKey('password'),
          obscureText: true,
          decoration: InputDecoration(hintText: "enter password"),
          validator: (value){
            if(value.toString().length<6){
              return 'Password is so small';
            }else{
              return null;
            }
          },
          onSaved: (value){
            setState(() {
              password = value!;
            });
          },
        ),
          SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  _formkey.currentState!.save();
                  islogin? signin(email, password):signup(email, password);
                }
              }, child: islogin? Text('Login') : Text('Signup'))),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              setState(() {
                islogin = !islogin;
              });
            }, child: islogin? Text('Dont have account? Signup'): Text('Already Signed Up? Login')),

          ],),),
      ),
    );
  }
}
