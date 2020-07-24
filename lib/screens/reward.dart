import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  
  final String cardName;
  final String distance;
  final String deadline;
  final String rewardStatus;
  final String storeName;

  RewardCard(
      {@required this.cardName,
      this.distance,
      @required this.deadline,
      @required this.rewardStatus,
      @required this.storeName});

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Card(
      color: Color.fromRGBO(204, 204, 204, 1),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              rewardStatus,
              style: TextStyle(fontSize: 27),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            )
          ]),
          Text(deadline),
          Text(cardName),
          Text(storeName)
        ],
      ),
    );
  }
}