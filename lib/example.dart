import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loading_button.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
              "Loading Button", style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoadingButtonPlus(
                    loadingWidget: const LinearProgressIndicator(color: Colors.black26,),
                    borderRadius: BorderRadius.circular(5),
                    height: 30,
                    width: 200,
                    padding: const EdgeInsets.all(5),
                    textColor: Colors.white,
                    isLoading: isLoading,
                    text: "Button Text",
                    onTap: () {
                      setState(() {
                        isLoading= !isLoading;
                      });
                    }),
              LoadingButtonPlus(
                    stockWidth: 2,
                    color: Colors.greenAccent,
                    height: 30,
                    width: 200,
                    padding: const EdgeInsets.all(5),
                    textColor: Colors.white,
                    isLoading: isLoading,
                    text: "Loading Button",
                    circularProgressColor: Colors.black,
                    onTap: () {
                      setState(() {
                        isLoading= !isLoading;
                      });
                    }),
              LoadingButtonPlus(
                  loadingWidget: const CupertinoActivityIndicator(color: Colors.black,) ,
                  gradient: const LinearGradient(colors: [
                    Color(0xffeeaeca),
                    Color(0xff94bbe9),
                  ],
                  stops: [0.3,1.0]
                  ),
                  height: 30,
                  width: 200,
                  padding: const EdgeInsets.all(5),
                  textColor: Colors.white,
                  isLoading: isLoading,
                  text: "Loading Button",
                  circularProgressColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isLoading= !isLoading;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
