import 'package:doit/pages/CreateAccount.dart';
import 'package:doit/pages/page1.dart';
import 'package:doit/pages/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(title: 'Do It!'),
        '/first': (context) => const PageOne(),
        '/second': (context) => const PageTwo(),
        
      },
      theme: ThemeData(
        // brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(centerTitle: true, toolbarHeight: 100),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'Roboto',
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.blueAccent)
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                "Login in to Thoughts!",
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
                    child: const Text('Sign In', style: TextStyle(color:Colors.white, fontSize: 18))),
              ),
              TextButton(onPressed: ()=>{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateAccount(title: "Create Account",)))
              }, child: const Text("New User? Click to Create an account"))
            ],
          ),
        ),
      ),
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     //
      //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
      //     // action in the IDE, or press "p" in the console), to see the
      //     // wireframe for each widget.
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         width:300,
      //         height:200,
      //         padding: const EdgeInsets.all(20),
      //         margin: const EdgeInsets.all(20),
      //         decoration: BoxDecoration(
      //         border: Border.all(width:3),
      //         borderRadius:BorderRadius.circular(10),
      //         color: Colors.greenAccent,

      //   ),

      //         child: PageView(  children: const [
      //           Text("Custom Item 1",
      //           style: TextStyle(color: Colors.black, fontSize: 16),),
      //             Text("Custom Item 2",
      //           style: TextStyle(color: Colors.black, fontSize: 16),)
      //         ],
      //      ),
      //       ),

      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),

    );
  }
}
