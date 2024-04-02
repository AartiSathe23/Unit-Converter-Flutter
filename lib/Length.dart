import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Length extends StatefulWidget {
  const Length({Key? key}) : super(key: key);

  @override
  _LengthState createState() => _LengthState();
}

class _LengthState extends State<Length> {
  String selectedUnit1 = 'Meter(m)';
  String selectedUnit2 = 'Meter(m)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Length'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerWithText(
                  color: Colors.teal,
                  text: 'From :',
                  fontSize: 18,
                ),
                SizedBox(width: 70),
                DropdownButton<String>(
                  value: selectedUnit1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUnit1 = newValue!;
                    });
                  },
                  underline: Container(
                    height: 2,
                    color: Colors.black54,
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  menuMaxHeight: 250,
                  itemHeight: 50,
                  items: <String>[
                      'Nanometer(nm)',
                      'Micrometer(μm)',
                      'Millimeter(mm)',
                      'Centimeter(cm)',
                      'Meter(m)',
                      'Kilometer(km)',
                      'Inch(in)',
                      'Foot(ft)',
                      'Yard(yd)'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) =>
                        DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                  )
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerWithText(
                  color: Colors.teal,
                  text: 'To :',
                  fontSize: 18,
                ),
                SizedBox(width: 70),
                DropdownButton<String>(
                  value: selectedUnit2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUnit2 = newValue!;
                    });
                  },
                  underline: Container(
                    height: 2,
                    color: Colors.black54,
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  menuMaxHeight: 250,
                  itemHeight: 50,
                  items: <String>[
                    'Nanometer(nm)',
                    'Micrometer(μm)',
                    'Millimeter(mm)',
                    'Centimeter(cm)',
                    'Meter(m)',
                    'Kilometer(km)',
                    'Inch(in)',
                    'Foot(ft)',
                    'Yard(yd)'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) =>
                        DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                  )
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerWithText(
                  color: Colors.teal,
                  text: 'Enter Value :',
                  fontSize: 18,
                ),
                SizedBox(width: 60),
                Container(
                  width: 130,
                  height: 50,
                  child: Card(color: Colors.teal.shade50,
                    child: TextField(
                      controller: inputController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double inputValue = double.tryParse(inputController.text) ?? 0.0;
                setState(() {
                  result = convertLength(inputValue, selectedUnit1, selectedUnit2);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade400,
                onPrimary: Colors.white,
              ),
              child: Text('Convert',style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
            SizedBox(height: 20),
            Text(
              'Conversion Result: $result',
              style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWithText extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;

  const ContainerWithText({
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
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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

double convertLength(double value, String fromUnit, String toUnit) {
  double meterValue = 0.0;

  switch (fromUnit) {
    case 'Nanometer(nm)':
      meterValue = value / 1e9;
      break;
    case 'Micrometer(μm)':
      meterValue = value / 1e6;
      break;
    case 'Millimeter(mm)':
      meterValue = value / 1000;
      break;
    case 'Centimeter(cm)':
      meterValue = value / 100;
      break;
    case 'Meter(m)':
      meterValue = value;
      break;
    case 'Kilometer(km)':
      meterValue = value * 1000;
      break;
    case 'Inch(in)':
      meterValue = value * 0.0254;
      break;
    case 'Foot(ft)':
      meterValue = value * 0.3048;
      break;
    case 'Yard(yd)':
      meterValue = value * 0.9144;
      break;
  }

  double result = 0.0;

  switch (toUnit) {
    case 'Nanometer(nm)':
      result = meterValue * 1e9;
      break;
    case 'Micrometer(μm)':
      result = meterValue * 1e6;
      break;
    case 'Millimeter(mm)':
      result = meterValue * 1000;
      break;
    case 'Centimeter(cm)':
      result = meterValue * 100;
      break;
    case 'Meter(m)':
      result = meterValue;
      break;
    case 'Kilometer(km)':
      result = meterValue / 1000;
      break;
    case 'Inch(in)':
      result = meterValue / 0.0254;
      break;
    case 'Foot(ft)':
      result = meterValue / 0.3048;
      break;
    case 'Yard(yd)':
      result = meterValue / 0.9144;
      break;
  }

  return result;
}