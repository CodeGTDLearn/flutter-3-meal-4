import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../config/specs.dart';
import '../config/titles_icons.dart';
import '../enums/affordability.dart';
import '../enums/complexity.dart';

class CardMeal extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complex;
  final Affordability afford;

  final Map<String, Object> _icons = TitlesAndIcons().cardMealIcons;
  Specs _dim;

  CardMeal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complex,
      @required this.afford});

  @override
  Widget build(BuildContext context) {
    _dim = Specs(context);
    return InkWell(
        onTap: () => _goToScreenMealdetails(context),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_dim.radius(4))),
            elevation: 4,
            margin: EdgeInsets.all(_dim.width(4)),
            child: Column(children: [
              Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_dim.radius(4)),
                        topRight: Radius.circular(_dim.radius(4))),
                    child: Image.network(this.imageUrl,
                        height: _dim.height(40),
                        width: _dim.width(100),
                        fit: BoxFit.cover)),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        color: Colors.black45,
                        padding: EdgeInsets.all(_dim.height(1)),
                        child: Text(this.title,
                            style: TextStyle(
                                fontSize: _dim.height(5),
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center))),
              ]),
              Padding(
                  padding: EdgeInsets.all(_dim.height(3.5)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _row(_icons['duration'], '$duration min'),
                        _row(_icons['complex'], describeEnum(this.complex)),
                        _row(_icons['afford'], describeEnum(this.afford)),
                      ]))
            ])));
  }

  Row _row(IconData icon, String text) {
    return Row(children: [
      Icon(icon),
      SizedBox(width: this._dim.height(2)),
      Text(text, style: TextStyle(fontSize: this._dim.height(2.5)))
    ]);
  }

  void _goToScreenMealdetails(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Routes.toScreenMealsDetails, arguments: {'id': this.id});
  }
}
