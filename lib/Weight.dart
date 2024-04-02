import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unitconverter/Length.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  String selectedUnit1 = 'Gram(g)';
  String selectedUnit2 = 'Gram(g)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Weight'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
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
                  'Nanogram(ng)',
                  'Microgram(μg)',
                  'Milligram(mg)',
                  'Gram(g)',
                  'Kilogram(kg)',
                  'Metric Ton(ton)',
                  'Ounce(oz)',
                  'Pound(lb)',
                  'Stone(st)',
                  'Tola(tola)',
                  'Carat(ct)',
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
                  'Nanogram(ng)',
                  'Microgram(μg)',
                  'Milligram(mg)',
                  'Gram(g)',
                  'Kilogram(kg)',
                  'Metric Ton(ton)',
                  'Ounce(oz)',
                  'Pound(lb)',
                  'Stone(st)',
                  'Tola(tola)',
                  'Carat(ct)',
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
                result = convertWeight(inputValue, selectedUnit1, selectedUnit2);
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.teal.shade400,
              onPrimary: Colors.white,
            ),
            child: Text('Convert',style: TextStyle(fontSize: 18),),
          ),
          SizedBox(height: 20),
          // Section to display unit conversion result
          Text(
            'Conversion Result: $result',
            style: TextStyle(fontSize: 18,color: Colors.black87,fontWeight: FontWeight.bold),
          ),
        ],
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

double convertWeight(double value, String fromUnit, String toUnit) {
  double gramValue = 0.0;

  switch (fromUnit) {
    case 'Nanogram(ng)':
      gramValue = value / 1e9;
      break;
    case 'Microgram(μg)':
      gramValue = value / 1e6;
      break;
    case 'Milligram(mg)':
      gramValue = value / 1000;
      break;
    case 'Gram(g)':
      gramValue = value;
      break;
    case 'Kilogram(kg)':
      gramValue = value * 1000;
      break;
    case 'Metric Ton(ton)':
      gramValue = value * 1e6;
      break;
    case 'Ounce(oz)':
      gramValue = value * 28.3495;
      break;
    case 'Pound(lb)':
      gramValue = value * 453.592;
      break;
    case 'Stone(st)':
      gramValue = value * 6350.29;
      break;
    case 'Tola(tola)':
      gramValue = value * 11.66;
      break;
    case 'Carat(ct)':
      gramValue = value / 5;
      break;
  }

  double result = 0.0;

  switch (toUnit) {
    case 'Nanogram(ng)':
      result = gramValue * 1e9;
      break;
    case 'Microgram(μg)':
      result = gramValue * 1e6;
      break;
    case 'Milligram(mg)':
      result = gramValue * 1000;
      break;
    case 'Gram(g)':
      result = gramValue;
      break;
    case 'Kilogram(kg)':
      result = gramValue / 1000;
      break;
    case 'Metric Ton(ton)':
      result = gramValue / 1e6;
      break;
    case 'Ounce(oz)':
      result = gramValue / 28.3495;
      break;
    case 'Pound(lb)':
      result = gramValue / 453.592;
      break;
    case 'Stone(st)':
      result = gramValue / 6350.29;
      break;
    case 'Tola(tola)':
      result = gramValue / 11.66;
      break;
    case 'Carat(ct)':
      result = gramValue * 5;
      break;
  }

  return result;
}