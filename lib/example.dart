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

  bool isLoading_1 = false;
  bool isLoading_2 = false;
  bool isLoading_3 = false;
  bool isLoading_4 = false;

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
                    height: 40,
                    width: 250,
                    padding: const EdgeInsets.all(5),
                    textColor: Colors.white,
                    isLoading: isLoading_1,
                    text: "Text",
                    onTap: () {
                      setState(() {
                        isLoading_1= !isLoading_1;
                      });
                    }),
              LoadingButtonPlus(
                    stockWidth: 2,
                    color: Colors.greenAccent,
                    height: 60,
                    width: 250,
                    padding: const EdgeInsets.all(5),
                    textColor: Colors.white,
                    isLoading: isLoading_2,
                    text: "Text",
                    circularProgressColor: Colors.black,
                    onTap: () {
                      setState(() {
                        isLoading_2= !isLoading_2;
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
                  height: 50,
                  width: 250,
                  padding: const EdgeInsets.all(5),
                  textColor: Colors.white,
                  isLoading: isLoading_3,
                  text: "Text",
                  circularProgressColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isLoading_3= !isLoading_3;
                    });
                  }),
              LoadingButtonPlus(
                  loadingWidget: Image.asset("assets/loading.gif") ,
                  color: const Color(0xff141e26),
                  height: 100,
                  width: 250,
                  padding: const EdgeInsets.all(5),
                  textColor: Colors.white,
                  isLoading: isLoading_4,
                  text: "Text",
                  circularProgressColor: Colors.black,
                  onTap: () {
                    setState(() {
                      isLoading_4= !isLoading_4;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
