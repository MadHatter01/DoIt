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
        '/':(context) => const MyHomePage(title: 'Do It!'),
        '/first':(context) => const PageOne(),
        '/second':(context) => const PageTwo()
,
      },
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
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
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _pswdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Preferences"),
      ),
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextFormField(
        controller: _emailcontroller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(hintText: "Enter an Email"),
              ),
              TextFormField(controller: _pswdcontroller, obscureText: true, decoration:const InputDecoration(hintText: "Enter an Password"),),
              ElevatedButton(onPressed: (){
                debugPrint("Email: ${_emailcontroller.text}");
                debugPrint("Password: ${_pswdcontroller.text}");
              }, child: const Text('Submit'))
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
