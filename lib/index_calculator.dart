import 'package:flutter/material.dart';
import 'dart:math';

class IndexCalc extends StatefulWidget {
  @override
  _IndexCalcState createState() => _IndexCalcState();
}

class _IndexCalcState extends State<IndexCalc> {
  final _painoFN = FocusNode();
  final _form = GlobalKey<FormState>();
  int pituus;
  int paino;
  bool showResult = false;
  void _laskeIndeksi() {
    _form.currentState.save();
    if(paino != null && pituus != null){
      setState(() {
        showResult = true;
      });
    }
    print(showResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painoindeksilaskuri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Pituus',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_painoFN);
                },
                onSaved: (value) {
                  pituus = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Paino',
                ),
                keyboardType: TextInputType.number,
                focusNode: _painoFN,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  paino = int.parse(value);
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: _laskeIndeksi,
                  child: Text('Laske'),
                ),
              ),
              if(showResult)
                Text('Painoindeksisi on: ${paino/pow(pituus/100, 2)}')
            ],
          ),
        ),
      ),
    );
  }
}
