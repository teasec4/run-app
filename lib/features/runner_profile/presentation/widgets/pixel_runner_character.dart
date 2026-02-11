import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PixelRunnerCharacter extends StatelessWidget {
  final double size;

  const PixelRunnerCharacter({
    Key? key,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unit = size / 12;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Head
          Positioned(
            top: unit * 0.5,
            left: unit * 4.5,
            child: Container(
              width: unit * 3,
              height: unit * 3,
              decoration: BoxDecoration(
                color: AppColors.characterSkin,
                border: Border.all(color: AppColors.primaryDark, width: 1),
              ),
              child: Stack(
                children: [
                  // Left Eye
                  Positioned(
                    top: unit * 0.7,
                    left: unit * 0.5,
                    child: Container(
                      width: unit * 0.6,
                      height: unit * 0.6,
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          width: unit * 0.3,
                          height: unit * 0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Right Eye
                  Positioned(
                    top: unit * 0.7,
                    right: unit * 0.5,
                    child: Container(
                      width: unit * 0.6,
                      height: unit * 0.6,
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          width: unit * 0.3,
                          height: unit * 0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Mouth
                  Positioned(
                    bottom: unit * 0.4,
                    left: unit * 1,
                    right: unit * 1,
                    child: Container(
                      height: unit * 0.3,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body
          Positioned(
            top: unit * 3.8,
            left: unit * 4.75,
            child: Container(
              width: unit * 2.5,
              height: unit * 3.5,
              decoration: BoxDecoration(
                color: AppColors.characterShirt,
                border: Border.all(color: AppColors.primaryDark, width: 1),
              ),
              child: Stack(
                children: [
                  // Chest stripe
                  Positioned(
                    top: unit * 0.2,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: unit * 2.5,
                      height: unit * 0.8,
                      color: AppColors.gold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Left Arm
          Positioned(
            top: unit * 4,
            left: unit * 3.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 1,
                  height: unit * 2.5,
                  decoration: BoxDecoration(
                    color: AppColors.characterSkin,
                    border: Border.all(color: AppColors.primaryDark, width: 0.5),
                  ),
                ),
                Container(
                  width: unit * 0.8,
                  height: unit * 0.8,
                  color: AppColors.primaryDark,
                ),
              ],
            ),
          ),

          // Right Arm
          Positioned(
            top: unit * 4,
            right: unit * 3.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 1,
                  height: unit * 2.5,
                  decoration: BoxDecoration(
                    color: AppColors.characterSkin,
                    border: Border.all(color: AppColors.primaryDark, width: 0.5),
                  ),
                ),
                Container(
                  width: unit * 0.8,
                  height: unit * 0.8,
                  color: AppColors.primaryDark,
                ),
              ],
            ),
          ),

          // Left Leg
          Positioned(
            top: unit * 7.4,
            left: unit * 4.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 0.9,
                  height: unit * 2.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterPants,
                    border: Border.all(color: AppColors.primaryDark, width: 0.5),
                  ),
                ),
                Container(
                  width: unit * 1.3,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterShoes,
                    border: Border.all(color: AppColors.textPrimary, width: 0.5),
                  ),
                ),
              ],
            ),
          ),

          // Right Leg
          Positioned(
            top: unit * 7.4,
            right: unit * 4.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 0.9,
                  height: unit * 2.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterPants,
                    border: Border.all(color: AppColors.primaryDark, width: 0.5),
                  ),
                ),
                Container(
                  width: unit * 1.3,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterShoes,
                    border: Border.all(color: AppColors.textPrimary, width: 0.5),
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
