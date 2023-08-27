import 'package:flutter/material.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.title});

  final String title;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _signKey = GlobalKey();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pswdcontroller = TextEditingController();
  final RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Preferences"),
      ),
      body: Center(
        child: Form(
          key: _signKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Image(image: AssetImage('assets/light-bulb.png'), width:80),
              const SizedBox(height:24),
              const Text(
                "Welcome to Thoughts!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24)),
                child: TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Enter an Email",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an email";
                    } else if (!emailValidator.hasMatch(value)) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                ),
              ),
              Container(
                 margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(28)),
                child: TextFormField(
                  controller: _pswdcontroller,
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: "Enter an Password",contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        border: InputBorder.none),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a Password";
                    } else if (value.length <= 8) {
                      return "Password must be atleast 8 characters";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width:250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 75, 0, 173),
                  borderRadius: BorderRadius.circular(28)
                ),
                child: TextButton(
                    onPressed: () {
                      if (_signKey.currentState == null) {
                        debugPrint("_formKey.currentState is null!");
                      }
                      if (_signKey.currentState!.validate()) {
                        debugPrint("Email: ${_emailcontroller.text}");
                        debugPrint("Password: ${_pswdcontroller.text}");
                      }
                    },
                    child: const Text('Create Account', style: TextStyle(color:Colors.white, fontSize: 18))),
              ),
              TextButton(onPressed: ()=>{
                Navigator.of(context).pop()
              }, child: const Text("Already have an account? Sign in here!"))
            ],
          ),
        ),
      ),
         );
  }
}
