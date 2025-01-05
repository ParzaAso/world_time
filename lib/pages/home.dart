import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String bgImage = data['isDayTime'] ? "day.png" : "night.png";
    Color bgColor =
        data['isDayTime'] ? Colors.blue : Colors.indigo[700] ?? Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/$bgImage"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'timeI': result['timeI'],
                      'locationI': result['locationI'],
                      
                      'flagI': result['flagI'],
                      'isDayTime': result['isDayTime'],

                    };
                  });
                },
                label: Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.grey[300]),
                ),
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['locationI'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data['timeI'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.grey[300],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
