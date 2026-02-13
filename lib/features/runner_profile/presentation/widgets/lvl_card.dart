import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LvlCard extends StatelessWidget{
  const LvlCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            Row(
              children: [
                Text("Level"),
                Text("1")
              ],
            ),
            Row(
              children: [
                Text("500"),
                Text("/"),
                Text("1000")
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}