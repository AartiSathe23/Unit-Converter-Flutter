import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Volume extends StatefulWidget {
  const Volume({Key? key}) : super(key: key);

  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  String selectedUnit1 = 'Liter(L)';
  String selectedUnit2 = 'Liter(L)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Volume'),
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
                  fontSize: 17,
                ),
                SizedBox(width: 20),
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
                    fontSize: 17,
                  ),
                  menuMaxHeight: 250,
                  itemHeight: 50,
                  items: <String>[
                    'Milliliter(mL)',
                    'Liter(L)',
                    'Cubic centimeter(cm³/cc)',
                    'Cubic meter(m³)',
                    'Teaspoon(tsp/ts)',
                    'Tablespoon(tbsp)',
                    'Fluid ounce(fl oz)',
                    'Cup(cup)',
                    'Pint(pt)',
                    'Quart(qt)',
                    'Gallon(gal)'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) =>
                        DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 17),
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
                  fontSize: 17,
                ),
                SizedBox(width: 20),
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
                    fontSize: 17,
                  ),
                  menuMaxHeight: 250,
                  itemHeight: 50,
                  items: <String>[
                    'Milliliter(mL)',
                    'Liter(L)',
                    'Cubic centimeter(cm³/cc)',
                    'Cubic meter(m³)',
                    'Teaspoon(tsp/ts)',
                    'Tablespoon(tbsp)',
                    'Fluid ounce(fl oz)',
                    'Cup(cup)',
                    'Pint(pt)',
                    'Quart(qt)',
                    'Gallon(gal)'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) =>
                        DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 17),
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
              children: [
                SizedBox(width: 20,),
                ContainerWithText(
                  color: Colors.teal,
                  text: 'Enter Value :',
                  fontSize: 17,
                ),
                SizedBox(width: 20),
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
                  result = convertVolume(inputValue, selectedUnit1, selectedUnit2);
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
        width: 110,
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

double convertVolume(double value, String fromUnit, String toUnit) {

  double milliliterValue = 0.0;

  switch (fromUnit) {
    case 'Milliliter(mL)':
      milliliterValue = value;
      break;
    case 'Liter(L)':
      milliliterValue = value * 1000;
      break;
    case 'Cubic centimeter(cm³/cc)':
      milliliterValue = value;
      break;
    case 'Cubic meter(m³)':
      milliliterValue = value * 1e6;
      break;
    case 'Teaspoon(tsp/ts)':
      milliliterValue = value * 5.91939;
      break;
    case 'Tablespoon(tbsp)':
      milliliterValue = value * 17.7582;
      break;
    case 'Fluid ounce(fl oz)':
      milliliterValue = value * 29.5735;
      break;
    case 'Cup(cup)':
      milliliterValue = value * 236.588;
      break;
    case 'Pint(pt)':
      milliliterValue = value * 473.176;
      break;
    case 'Quart(qt)':
      milliliterValue = value * 946.353;
      break;
    case 'Gallon(gal)':
      milliliterValue = value * 3785.41;
      break;
  }

  double result = 0.0;

  switch (toUnit) {
    case 'Milliliter(mL)':
      result = milliliterValue;
      break;
    case 'Liter(L)':
      result = milliliterValue / 1000;
      break;
    case 'Cubic centimeter(cm³/cc)':
      result = milliliterValue;
      break;
    case 'Cubic meter(m³)':
      result = milliliterValue / 1e6;
      break;
    case 'Teaspoon(tsp/ts)':
      result = milliliterValue / 5.91939;
      break;
    case 'Tablespoon(tbsp)':
      result = milliliterValue / 17.7582;
      break;
    case 'Fluid ounce(fl oz)':
      result = milliliterValue / 29.5735;
      break;
    case 'Cup(cup)':
      result = milliliterValue / 236.588;
      break;
    case 'Pint(pt)':
      result = milliliterValue / 473.176;
      break;
    case 'Quart(qt)':
      result = milliliterValue / 946.353;
      break;
    case 'Gallon(gal)':
      result = milliliterValue / 3785.41;
      break;
  }

  return result;
}