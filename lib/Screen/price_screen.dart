import 'dart:convert';

import 'package:bitcoin_tickler_custom/Uilities/customCard.dart';
import 'package:bitcoin_tickler_custom/Model/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int? btc;
  int? eth;
  int? ltc;

  String selectedCurrency = 'USD';


  var urlBtc = 'https://rest.coinapi.io/v1/exchangerate/BTC';
  var urleth = 'https://rest.coinapi.io/v1/exchangerate/ETH';
  var urlltc = 'https://rest.coinapi.io/v1/exchangerate/LTC';

  Future getDataBtc() async {
    var response = await http.get(Uri.parse(
        '$urlBtc/$selectedCurrency?apikey=5FD3F9F3-8C02-4EC1-8790-2CC96A43440F'));

    setState(() {
      var decode = jsonDecode(response.body);

      double rateint = decode['rate'];
      btc = rateint.toInt();
    });
  }


  Future getDataEth() async {
    var response = await http.get(Uri.parse(
        '$urleth/$selectedCurrency?apikey=5FD3F9F3-8C02-4EC1-8790-2CC96A43440F'));

    setState(() {
      var decode = jsonDecode(response.body);

      double rateint = decode['rate'];
      eth = rateint.toInt();
    });
  }


  Future getDataLtc() async {
    var response = await http.get(Uri.parse(
        '$urlltc/$selectedCurrency?apikey=5FD3F9F3-8C02-4EC1-8790-2CC96A43440F'));

    setState(() {
      var decode = jsonDecode(response.body);

      double rateint = decode['rate'];
      ltc = rateint.toInt();
    });
  }


  DropdownButton getDropdownItemsAndroid( ) {
    List<DropdownMenuItem> dropDownAdds = [];

    for (String currency in currenciesList) {
      var dropItems = DropdownMenuItem(child: Text(currency), value: currency);

      dropDownAdds.add(dropItems);
    }

    return DropdownButton<dynamic>(
        value: selectedCurrency,
        items: dropDownAdds,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            getDataBtc();
            getDataEth();
            getDataLtc();
          });
        });
  }

  CupertinoPicker getPickerItemsIOS() {
    List<Widget> pickerItemsAdds = [];

    for (String curry in currenciesList) {
      var pickerItems = Text(curry);

      pickerItemsAdds.add(pickerItems);
    }

    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {},
        children: pickerItemsAdds);
  }

  @override
  void initState() {
    super.initState();
    getDataBtc();
    getDataEth();
    getDataLtc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BTC(
            raten: btc,
            selectedCurrency: selectedCurrency,
            coinName: 'BTC',
          ),
          BTC(
              raten: eth,
              selectedCurrency: selectedCurrency,
              coinName: 'ETH'),
          BTC(
              raten: ltc,
              selectedCurrency: selectedCurrency,
              coinName: 'LTC'),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS
                  ? getPickerItemsIOS()
                  : getDropdownItemsAndroid()),
        ],
      ),
    );
  }
}

//
//
