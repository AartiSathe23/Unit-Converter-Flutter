import 'package:flutter/material.dart';
import 'package:unitconverter/Currency.dart';
import 'package:unitconverter/Length.dart';
import 'package:unitconverter/Weight.dart';

import 'Temperature.dart';
import 'Time.dart';
import 'Volume.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Unit Converter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Length()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.straighten,
                      color: Colors.teal,
                      text: 'Length',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Weight()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.linear_scale,
                      color: Colors.teal,
                      text: 'Weight',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Currency()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.monetization_on_outlined,
                      color: Colors.teal,
                      text: 'Currency',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Temperature()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.device_thermostat,
                      color: Colors.teal,
                      text: 'Temperature',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Time()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.timer_outlined,
                      color: Colors.teal,
                      text: 'Time',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Volume()),
                      );
                    },
                    child: ContainerWithIconAndText(
                      icon: Icons.local_drink_rounded,
                      color: Colors.teal,
                      text: 'Volume',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWithIconAndText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double fontSize;

  const ContainerWithIconAndText({
    required this.icon,
    required this.color,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}