import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String dicount;
  final String deadline;
  final int pointNum;
  final String itemName;
  final String storeName;
  final String distance;
  final String location;

  StoreCard({
    this.dicount,
    this.deadline,
    this.pointNum,
    this.itemName,
    this.storeName,
    this.distance,
    this.location,
  });
  List<Widget> singleCircle(int rowNum, int pointNum) {
    List<Widget> list = [];
    for (int i = rowNum; i < rowNum + 4; i++) {
      list.add(i + 1 <= pointNum
          ? Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.8),
              ),
            )
          : Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(26),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ));
    }
    return list;
  }

  Widget buildCircleGrid(int pointNum) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row( children: [
            ...singleCircle(0, pointNum),
          ]),
          Row( children: [
            ...singleCircle(4, pointNum),
          ]),
          Row( children: [
            ...singleCircle(8, pointNum),
          ]),
        ],
      ),
    );
  }

  Widget buildText(String title, double size) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildStoreGraphicInfo(String distance, String location) {
    return Row(
      children: [
        Icon(Icons.location_on),
        SizedBox(
          width: 2,
        ),
        Text(distance),
        SizedBox(
          width: 10,
        ),
        Text(location),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Card(
            color: Color.fromRGBO(240, 240, 240, 1),
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    dicount,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(deadline),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 50, 30),
                  child: buildCircleGrid(pointNum),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: buildText(itemName, 28),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(storeName, 18),
                      buildStoreGraphicInfo(distance, location),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 50, 10),
                  child: InkWell(
                      child: Row(
                        children: [
                          Text(
                            'Learn more ',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ],
                      ),
                      onTap: () {}),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: new IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.grey.withOpacity(0.5),
                  size: 40,
                ),
                onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
