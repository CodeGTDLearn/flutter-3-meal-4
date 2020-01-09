import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:meal_4/config/routes.dart';
import 'package:meal_4/config/titles_icons.dart';
import 'package:meal_4/enums/affordability.dart';
import 'package:meal_4/enums/complexity.dart';

class CardMeal extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complex;
  final Affordability afford;

  final Map<String, Object> _icons = TitlesAndIcons().widgetMealIcons;

  CardMeal(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complex,
      @required this.afford});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToScreenMealdetails(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(this.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover)),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        width: 300,
                        color: Colors.black45,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(this.title,
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRow(_icons['duration'], '$duration min'),
                  _buildRow(_icons['complex'], describeEnum(this.complex)),
                  _buildRow(_icons['afford'], describeEnum(this.afford)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildRow(IconData icon, String text) {
    return Row(children: <Widget>[Icon(icon), SizedBox(width: 6), Text(text)]);
  }

  void _goToScreenMealdetails(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.toScreenMealsDetails, arguments: {
      'id': this.id,
    });
  }
}
