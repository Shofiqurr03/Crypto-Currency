


import 'package:flutter/material.dart';

class BTC extends StatelessWidget {
  const BTC({
    required this.raten,
    required this.selectedCurrency,
    required this.coinName,
  }) ;

  final int? raten;
  final String selectedCurrency;
  final String coinName ;




  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(

            raten==null?'LOADING...':
            '1 $coinName = $raten $selectedCurrency'

            ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
