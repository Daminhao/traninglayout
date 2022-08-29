import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlipCard',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

var infoTasks = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.0,
          height: 50.0,
          child: Image.asset('images/icon_flutter.png'),
        ),
        const Text("Flutter"),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.0,
          height: 50.0,
          child: Image.asset('images/icon_python.png'),
        ),
        const Text("Python"),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70.0,
          height: 50.0,
          child: Image.asset('images/icon_firebase.png'),
        ),
        const Text("FireBase"),
      ],
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _renderBg() {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 23, 22, 22)),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0x00FFFFFF),
      ),
    );
  }

  _renderContent(context) {
    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
          left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: const Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        front: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(223, 162, 168, 164),
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                radius: 57,
                backgroundColor: Color.fromARGB(223, 44, 45, 44),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/599e3b95636919.5eb96c0445ea7.jpg'),
                ),
                //Image.asset('images/user.png'),
              ),
              Text(
                'DANILO',
                style: TextStyle(fontSize: 30, height: 2.2),
              ),
              Text(
                'Dev Junior at TECAAP',
                style: TextStyle(
                  fontSize: 20, height: 2.2, // <-- SEE HERE
                ),
              ),
              Text(
                'Click here to flip front',
                style: TextStyle(
                  fontSize: 15, height: 5.2, // <-- SEE HERE
                ),
              )
            ],
          ), // Text('Click here to flip back',
        ),
        back: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(223, 162, 168, 164),
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Minhas principais Staks:',
                style: TextStyle(
                  fontSize: 30,
                  height: 4,
                ),
              ),
              infoTasks,
              const Text(
                'Click here to flip front',
                style: TextStyle(
                  fontSize: 15, height: 5.2, // <-- SEE HERE
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlipCard'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
