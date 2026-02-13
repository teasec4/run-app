import 'package:flutter/material.dart';

class StepsCcalCard extends StatelessWidget {
  const StepsCcalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("steps"), Text("1000")]
              ),
              SizedBox(
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 28,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [Text("ccal"), Text("200")]),
              SizedBox(
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
