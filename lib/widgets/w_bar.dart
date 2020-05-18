import 'package:flutter/material.dart';

class WBar extends StatelessWidget {
  final String day;
  final int percentage;
  final double amount;
  final tHeight = 110.0;
  final width = 20.0;

  WBar(this.day, this.percentage, this.amount);

  @override
  Widget build(BuildContext context) {
    final hBox2 = (tHeight * (percentage) / 100);
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              _WBarPart(width, tHeight, Colors.white),
              _WBarPart(width, hBox2, Colors.green),
            ],
          ),
          FittedBox
          (fit: BoxFit.fitWidth,
            child: Text(
              '\$${amount.toStringAsFixed(0)}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Text(
            day,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class _WBarPart extends StatelessWidget {
  final Color color;
  final width, height;

  _WBarPart(this.width, this.height, this.color);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
            border: Border.all(
              color: Colors.black,
              width: 1,
            )),
      ),
    );
  }
}
