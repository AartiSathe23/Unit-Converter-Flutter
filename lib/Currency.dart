import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String selectedUnit1 = 'Indian Rupee(INR)';
  String selectedUnit2 = 'Indian Rupee(INR)';
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Currency'),
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
                SizedBox(width: 30),
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
                    'United States Dollar(USD)',
                    'Euro(EUR)',
                    'British Pound(GBP)',
                    'Japanese Yen(JPY)',
                    'Canadian Dollar(CAD)',
                    'Australian Dollar(AUD)',
                    'Singapore Dollar(SGD)',
                    'Hong Kong Dollar(HKD)',
                    'New Zealand Dollar(NZD)',
                    'Swiss Franc(CHF)',
                    'Chinese Yuan(CNY)',
                    'Indian Rupee(INR)',
                    'Brazilian Real(BRL)',
                    'South African Rand (ZAR)',
                    'Russian Ruble(RUB)',
                    'Mexican Peso(MXN)',
                    'Indonesian Rupiah(IDR)',
                    'Saudi Riyal(SAR)',
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
                SizedBox(width: 30),
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
                    'United States Dollar(USD)',
                    'Euro(EUR)',
                    'British Pound(GBP)',
                    'Japanese Yen(JPY)',
                    'Canadian Dollar(CAD)',
                    'Australian Dollar(AUD)',
                    'Singapore Dollar(SGD)',
                    'Hong Kong Dollar(HKD)',
                    'New Zealand Dollar(NZD)',
                    'Swiss Franc(CHF)',
                    'Chinese Yuan(CNY)',
                    'Indian Rupee(INR)',
                    'Brazilian Real(BRL)',
                    'South African Rand (ZAR)',
                    'Russian Ruble(RUB)',
                    'Mexican Peso(MXN)',
                    'Indonesian Rupiah(IDR)',
                    'Saudi Riyal(SAR)',
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
                SizedBox(width: 10,),
                ContainerWithText(
                  color: Colors.teal,
                  text: 'Enter Value :',
                  fontSize: 17,
                ),
                SizedBox(width: 40),
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
                  result = convertCurrency(inputValue, selectedUnit1, selectedUnit2);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade400,
                onPrimary: Colors.white,
              ),
              child: Text('Convert',style: TextStyle(fontSize: 17),),
            ),
            SizedBox(height: 20),
            Text(
              'Conversion Result: $result',
              style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.bold),
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

double convertCurrency(double amount, String fromCurrency, String toCurrency) {
  Map<String, double> exchangeRates = {
    'United States Dollar(USD)': 1.0,
    'Euro(EUR)': 0.92,
    'British Pound(GBP)': 0.79,
    'Japanese Yen(JPY)': 147.86,
    'Canadian Dollar(CAD)': 1.35,
    'Australian Dollar(AUD)': 1.52,
    'Singapore Dollar(SGD)': 1.34,
    'Hong Kong Dollar(HKD)': 7.82,
    'New Zealand Dollar(NZD)': 1.64,
    'Swiss Franc(CHF)': 0.87,
    'Chinese Yuan(CNY)': 7.09,
    'Indian Rupee(INR)': 83.16,
    'Brazilian Real(BRL)': 4.95,
    'South African Rand(ZAR)': 18.98,
    'Russian Ruble(RUB)': 88.87,
    'Mexican Peso(MXN)': 17.26,
    'Indonesian Rupiah(IDR)': 15717.00,
    'Saudi Riyal(SAR)': 3.75,
  };

  if (!exchangeRates.containsKey(fromCurrency) || !exchangeRates.containsKey(toCurrency)) {
    throw Exception('Invalid currency selection');
  }

  double fromRate = exchangeRates[fromCurrency]!;
  double toRate = exchangeRates[toCurrency]!;
  double result = (amount / fromRate) * toRate;

  return result;
}