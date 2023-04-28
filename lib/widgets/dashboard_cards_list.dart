import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardCardsList extends StatelessWidget {
  const DashboardCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            margin: EdgeInsets.only(left: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: Colors.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://picsum.photos/seed/4/300/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            margin: EdgeInsets.only(left: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: Colors.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://picsum.photos/seed/1/300/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            margin: EdgeInsets.only(left: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: Colors.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://picsum.photos/seed/2/300/300",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
