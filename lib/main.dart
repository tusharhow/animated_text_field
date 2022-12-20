import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var width = 200.0;
  var height = 50.0;
  AlignmentGeometry alignment = Alignment.center;
  BorderRadius borderRadius = BorderRadius.circular(10);

  Future _animateTextFormField() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      width = 300;
      height = 150;
      alignment = Alignment.topCenter;
      borderRadius = BorderRadius.circular(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: alignment,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                onEnd: () async {
                  setState(() {
                    width = 200;
                    height = 50;
                    alignment = Alignment.center;
                    borderRadius = BorderRadius.circular(10);
                  });
                  await Future.delayed(const Duration(milliseconds: 200));
                },
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: const TextStyle(
                      color: Colors.black26,
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: borderRadius,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: 'Username',
                  ),
                  onTap: () {
                    setState(() {
                      width = 300;
                      height = 150;
                      alignment = Alignment.topCenter;
                      borderRadius = BorderRadius.circular(0);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateTextFormField,
        tooltip: 'Animate',
        child: const Icon(Icons.animation),
      ),
    );
  }
}
