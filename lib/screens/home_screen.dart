import 'package:flutter/material.dart';
import 'package:hotel_mng/screens/login_screen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key}) ; 

  @override
   State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
       backgroundColor: const Color.fromARGB(255, 200, 82, 255),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
             
              const SizedBox(
                height: 15,
              ),
              ActionChip(
                  label:const Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
   
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Signin()));
  }
}
  

