import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String selectedUnit1 = 'Second(s)';
  String selectedUnit2 = 'Second(s)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Time'),
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
                    'Second(s)',
                    'Minute(min)',
                    'Hour(hr)',
                    'Day(day)',
                    'Week(week)',
                    'Month(month)',
                    'Year(year)'
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
                    'Second(s)',
                    'Minute(min)',
                    'Hour(hr)',
                    'Day(day)',
                    'Week(week)',
                    'Month(month)',
                    'Year(year)'
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
                  result = convertTime(inputValue, selectedUnit1, selectedUnit2);
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

double convertTime(double value, String fromUnit, String toUnit) {
  const secondsInMinute = 60;
  const minutesInHour = 60;
  const hoursInDay = 24;
  const daysInWeek = 7;
  const daysInMonth = 30;
  const daysInYear = 365;


  double secondsValue = 0.0;

  switch (fromUnit) {
    case 'Second(s)':
      secondsValue = value;
      break;
    case 'Minute(min)':
      secondsValue = value * secondsInMinute;
      break;
    case 'Hour(hr)':
      secondsValue = value * secondsInMinute * minutesInHour;
      break;
    case 'Day(day)':
      secondsValue = value * secondsInMinute * minutesInHour * hoursInDay;
      break;
    case 'Week(week)':
      secondsValue = value * secondsInMinute * minutesInHour * hoursInDay * daysInWeek;
      break;
    case 'Month(month)':
      secondsValue = value * secondsInMinute * minutesInHour * hoursInDay * daysInMonth;
      break;
    case 'Year(year)':
      secondsValue = value * secondsInMinute * minutesInHour * hoursInDay * daysInYear;
      break;
  }

  double result = 0.0;

  switch (toUnit) {
    case 'Second(s)':
      result = secondsValue;
      break;
    case 'Minute(min)':
      result = secondsValue / secondsInMinute;
      break;
    case 'Hour(hr)':
      result = secondsValue / (secondsInMinute * minutesInHour);
      break;
    case 'Day(day)':
      result = secondsValue / (secondsInMinute * minutesInHour * hoursInDay);
      break;
    case 'Week(week)':
      result = secondsValue / (secondsInMinute * minutesInHour * hoursInDay * daysInWeek);
      break;
    case 'Month(month)':
      result = secondsValue / (secondsInMinute * minutesInHour * hoursInDay * daysInMonth);
      break;
    case 'Year(year)':
      result = secondsValue / (secondsInMinute * minutesInHour * hoursInDay * daysInYear);
      break;
  }

  return result;
}