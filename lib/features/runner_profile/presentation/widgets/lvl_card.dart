import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LvlCard extends StatelessWidget{
  const LvlCard({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
      child: Column(
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
                  Text("200"),
                  Text("/"),
                  Text("1000")
                ],
              )
            ],
          ),
          SizedBox(
            height: 14,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: 0.2,
                minHeight: 14,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}