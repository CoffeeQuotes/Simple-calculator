import 'package:flutter/material.dart';
import 'package:lemicalculate/calculator.dart';

class ExpandedButton extends StatelessWidget {
  ExpandedButton({this.onPressed, this.child, this.color});
  final Widget child;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 10.0,
          child: FlatButton(
            onPressed: onPressed,
            child: child,
            color: color,
          ),
        ),
      );
}

class ExpandedRow extends StatelessWidget {
  ExpandedRow({this.children, this.crossAxisAlignment});
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Row(
          children: children,
          crossAxisAlignment: crossAxisAlignment,
        ),
      );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primaryColor: Color(0xff082010),
        backgroundColor: Color(0xff202818),
      ),
      home: CalculatorHomePage(
        title: "Calculator",
      ),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  CalculatorHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _str = "0";

  var _calculation = Calculation();
  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      try {
        _str = _calculation.getResult().toString();
      } on DivideByZeroException {
        _str = "You must not divide by Zero";
      } finally {
        _calculation = new Calculation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff082010),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.w100,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Card(
              color: Color(0xff78A060),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  _str,
                  textAlign: TextAlign.end,
                  textScaleFactor: 2,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 10.0,
                    child: FlatButton(
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          color: Color(0xffD0C8B8),
                          letterSpacing: 6.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () {
                        deleteAll();
                      },
                      color: Color(0xff384830),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    margin: EdgeInsets.all(10),
                    elevation: 10.0,
                    child: FlatButton(
                      child: Text(
                        "<",
                        style: TextStyle(
                          color: Color(0xffD0C8B8),
                          letterSpacing: 6.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      onPressed: () {
                        deleteOne();
                      },
                      color: Color(0xff585840),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(children: [
                    ExpandedRow(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedButton(
                          child: Text(
                            '7',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('7');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '8',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('8');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('9');
                          },
                          color: Color(0xff508848),
                        ),
                      ],
                    ),
                    ExpandedRow(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedButton(
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('4');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('5');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('6');
                          },
                          color: Color(0xff508848),
                        ),
                      ],
                    ),
                    ExpandedRow(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedButton(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('1');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('2');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('3');
                          },
                          color: Color(0xff508848),
                        ),
                      ],
                    ),
                    ExpandedRow(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ExpandedButton(
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('0');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '.',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            add('.');
                          },
                          color: Color(0xff508848),
                        ),
                        ExpandedButton(
                          child: Text(
                            '=',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD0C8B8),
                            ),
                          ),
                          onPressed: () {
                            getResult();
                          },
                          color: Color(0xffB80000),
                        ),
                      ],
                    ),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ExpandedButton(
                        child: Text(
                          '÷',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0C8B8),
                          ),
                        ),
                        onPressed: () {
                          add('÷');
                        },
                        color: Color(0xff205028),
                      ),
                      ExpandedButton(
                        child: Text(
                          "x",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0C8B8),
                          ),
                        ),
                        onPressed: () {
                          add('x');
                        },
                        color: Color(0xff205028),
                      ),
                      ExpandedButton(
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0C8B8),
                          ),
                        ),
                        onPressed: () {
                          add('-');
                        },
                        color: Color(0xff205028),
                      ),
                      ExpandedButton(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffD0C8B8),
                          ),
                        ),
                        onPressed: () {
                          add('+');
                        },
                        color: Color(0xff205028),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
