import 'package:flutter/material.dart';

const mainColor = Color(0xFF314833);
const fillColor = Color(0xFFECE5D8);
const textColor = Colors.black;

class CurrencyConversionPage extends StatefulWidget {
  const CurrencyConversionPage({Key? key}) : super(key: key);

  @override
  State<CurrencyConversionPage> createState() => _CurrencyConversionPageState();
}

String convertCurrencies(
  String currency1,
  String currency2,
  String input,
) {
  double? doubleCurrency1 = double.tryParse(currency1);
  double? doubleCurrency2 = double.tryParse(currency2);
  double? doubleAmount = double.tryParse(input);

  if (doubleCurrency1 != null &&
      doubleCurrency2 != null &&
      doubleAmount != null) {
    double result = doubleAmount * doubleCurrency2 / doubleCurrency1;
    return result.toString();
  } else {
    return 'Invalid input';
  }
}

class _CurrencyConversionPageState extends State<CurrencyConversionPage> {
  final _inputValueController = TextEditingController();

  String firstCurrencyValue = "1";
  String secondCurrencyValue = "1";
  String convertedResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Container(
        color: fillColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _firstDropdown(),
                const SizedBox(width: 20),
                Container(
                  color: fillColor,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                _secondDropdown(),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 300,
              child: TextFormField(
                controller: _inputValueController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: "Masukkan value",
                  labelStyle: const TextStyle(color: mainColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: mainColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: mainColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              width: 200,
              decoration: const BoxDecoration(color: fillColor),
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'Result : ',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    convertedResult,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: fillColor,
                  backgroundColor: mainColor,
                  shadowColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Convert',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(
                    () {
                      convertedResult = convertCurrencies(
                        firstCurrencyValue,
                        secondCurrencyValue,
                        _inputValueController.text,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _firstDropdown() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 100,
      child: DropdownButtonFormField<String>(
        value: firstCurrencyValue,
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            firstCurrencyValue = newValue!;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: fillColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: mainColor,
            ),
          ),
          focusColor: mainColor,
          filled: true,
          fillColor: fillColor,
          labelText: 'Currency',
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  Widget _secondDropdown() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 100,
      child: DropdownButtonFormField<String>(
        value: secondCurrencyValue,
        items: dropdownItems,
        onChanged: (String? newValue) {
          setState(() {
            secondCurrencyValue = newValue!;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: fillColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: mainColor,
            ),
          ),
          focusColor: mainColor,
          filled: true,
          fillColor: fillColor,
          labelText: 'Currency',
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.all(15),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: '1',
        child: Text("USD"),
      ),
      const DropdownMenuItem(
        value: '16087.00',
        child: Text("IDR"),
      ),
      const DropdownMenuItem(
        value: '0.27',
        child: Text("SAR"),
      ),
    ];
    return menuItems;
  }
}
