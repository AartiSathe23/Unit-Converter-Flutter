import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  String selectedUnit1 = 'Celsius(°C)';
  String selectedUnit2 = 'Celsius(°C)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Temperature'),
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
                    'Celsius(°C)',
                    'Fahrenheit(°F)',
                    'Kelvin(K)',
                    'Rankine(°R)'
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
                    'Celsius(°C)',
                    'Fahrenheit(°F)',
                    'Kelvin(K)',
                    'Rankine(°R)'
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
                  child: Card(
                    color: Colors.teal.shade50,
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
                  result = convertTemperature(inputValue, selectedUnit1, selectedUnit2);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade400,
                onPrimary: Colors.white,
              ),
              child: Text('Convert',style: TextStyle(fontSize: 18),),
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

double convertTemperature(double value, String fromUnit, String toUnit) {
  double celsiusValue = 0.0;

  switch (fromUnit) {
    case 'Celsius(°C)':
      celsiusValue = value;
      break;
    case 'Fahrenheit(°F)':
      celsiusValue = (value - 32) * 5 / 9;
      break;
    case 'Kelvin(K)':
      celsiusValue = value - 273.15;
      break;
    case 'Rankine(°R)':
      celsiusValue = (value - 491.67) * 5 / 9;
      break;
  }

  double result = 0.0;

  switch (toUnit) {
    case 'Celsius(°C)':
      result = celsiusValue;
      break;
    case 'Fahrenheit(°F)':
      result = celsiusValue * 9 / 5 + 32;
      break;
    case 'Kelvin(K)':
      result = celsiusValue + 273.15;
      break;
    case 'Rankine(°R)':
      result = (celsiusValue + 273.15) * 9 / 5;
      break;
  }

  return result;
}