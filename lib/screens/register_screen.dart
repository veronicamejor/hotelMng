import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

   @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

   get _formKey => GlobalKey<FormState>();

  final firstNameEditingController =  TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController =  TextEditingController();
  final passwordEditingController =  TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
   
  @override
  Widget build(BuildContext context) {

    // //firstname field
    //    final firstNameField = TextFormField(
    //     autofocus: false,
    //     controller: firstNameEditingController,
    //     keyboardType: TextInputType.name,
    //     validator: (value) {
    //       RegExp regex = RegExp(r'^.{3,}$');
    //       if (value!.isEmpty) {
    //         return ("First Name cannot be Empty");
    //       }
    //       if (!regex.hasMatch(value)) {
    //         return ("Enter Valid name(Min. 3 Character)");
    //       }
    //       return null;
    //     },
    //     onSaved: (value) {
    //       firstNameEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.next,
    //     decoration: InputDecoration(
    //       prefixIcon: const Icon(Icons.account_circle,color: Colors.black,),
    //       contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "First Name",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ));

    //      //second name field
    // final secondNameField = TextFormField(
    //     autofocus: false,
    //     controller: secondNameEditingController,
    //     keyboardType: TextInputType.name,
    //      validator: (value) {
    //       if (value!.isEmpty) {
    //         return ("Second Name cannot be Empty");
    //       }
    //       return null;
    //     },
    //     onSaved: (value) {
    //       secondNameEditingController.text = value!;
    //     },
    //     textInputAction: TextInputAction.next,
    //     decoration: InputDecoration(
    //       prefixIcon: const Icon(Icons.account_circle,color: Colors.black,),
    //       contentPadding:const  EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "Second Name",
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ));


 //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:  const Icon(Icons.mail,color: Colors.black,),
          contentPadding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

        //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:const  Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

          //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key,color: Colors.black,),
          contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

         //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 200, 82, 255),
      child: MaterialButton(
          padding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUserUp(emailEditingController.text, passwordEditingController.text);
        
          },
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );

          
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Color.fromARGB(255, 200, 54, 244)),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>  [
                    const SizedBox(height: 45),
                    // firstNameField,
                    // const SizedBox(height: 20),
                    // secondNameField,
                    // const SizedBox(height: 20),
                    emailField,
                    const SizedBox(height: 20),
                    passwordField,
                    const SizedBox(height: 20),
                    confirmPasswordField,
                     const SizedBox(height: 20),
                    signUpButton,
                    const SizedBox(height: 15),
                    ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  
 
}

  
   void signUserUp(String text, String text2) async {
//signin
     {
      if(passwordEditingController.text == confirmPasswordEditingController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController.text,
        password: passwordEditingController.text,
      );
      }else{
        showErrorMessage("Passwords don't match");
      }
    } 
  }

  // wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor:  Color.fromARGB(255, 200, 82, 255),
          title: Center(
            child: Text(
             "Passwords don't match",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
