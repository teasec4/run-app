import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PixelRunnerCharacter extends StatefulWidget {
  final double size;

  const PixelRunnerCharacter({Key? key, this.size = 120}) : super(key: key);

  @override
  State<PixelRunnerCharacter> createState() => _PixelRunnerCharacterState();
}

class _PixelRunnerCharacterState extends State<PixelRunnerCharacter>
    with SingleTickerProviderStateMixin {
  late AnimationController _legController;

  @override
  void initState() {
    super.initState();
    _legController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat();
    _legController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _legController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unit = widget.size / 12;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.blue.withValues(alpha: 0.25),
                    Colors.blue.withValues(alpha: 0.08),
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),

          // Head (rounded)
          Positioned(
            top: unit * 0.5,
            left: unit * 4.5,
            child: Container(
              width: unit * 3,
              height: unit * 3,
              decoration: BoxDecoration(
                color: AppColors.characterSkin,
                border: Border.all(color: AppColors.primaryDark, width: 1),
                borderRadius: BorderRadius.circular(unit * 0.3),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(unit * 0.2),
                      ),
                      child: Center(
                        child: Container(
                          width: unit * 0.3,
                          height: unit * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(unit * 0.15),
                          ),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(unit * 0.2),
                      ),
                      child: Center(
                        child: Container(
                          width: unit * 0.3,
                          height: unit * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(unit * 0.15),
                          ),
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
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(unit * 0.15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Body (rounded)
          Positioned(
            top: unit * 3.8,
            left: unit * 4.75,
            child: Container(
              width: unit * 2.5,
              height: unit * 3.5,
              decoration: BoxDecoration(
                color: AppColors.characterShirt,
                border: Border.all(color: AppColors.primaryDark, width: 1),
                borderRadius: BorderRadius.circular(unit * 0.4),
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
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(unit * 0.2),
                      ),
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
                    border: Border.all(
                      color: AppColors.primaryDark,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.25),
                  ),
                ),
                Container(
                  width: unit * 0.8,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(unit * 0.2),
                  ),
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
                    border: Border.all(
                      color: AppColors.primaryDark,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.25),
                  ),
                ),
                Container(
                  width: unit * 0.8,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(unit * 0.2),
                  ),
                ),
              ],
            ),
          ),

          // Left Leg - Animated
          Positioned(
            top: unit * 7.4 + _getLeftLegOffset(unit),
            left: unit * 4.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 0.9,
                  height: unit * 2.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterPants,
                    border: Border.all(
                      color: AppColors.primaryDark,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.25),
                  ),
                ),
                Container(
                  width: unit * 1.3,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterShoes,
                    border: Border.all(
                      color: AppColors.textPrimary,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.2),
                  ),
                ),
              ],
            ),
          ),

          // Right Leg - Animated
          Positioned(
            top: unit * 7.4 + _getRightLegOffset(unit),
            right: unit * 4.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: unit * 0.9,
                  height: unit * 2.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterPants,
                    border: Border.all(
                      color: AppColors.primaryDark,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.25),
                  ),
                ),
                Container(
                  width: unit * 1.3,
                  height: unit * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.characterShoes,
                    border: Border.all(
                      color: AppColors.textPrimary,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(unit * 0.2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getLeftLegOffset(double unit) {
    final animationValue = _legController.value;
    // Left leg up first, then down
    if (animationValue < 0.5) {
      return -unit * animationValue * 1.5; // Moving up
    } else {
      return -unit * (1 - animationValue) * 1.5; // Moving down
    }
  }

  double _getRightLegOffset(double unit) {
    final animationValue = _legController.value;
    // Right leg opposite - down first, then up
    if (animationValue < 0.5) {
      return unit * (animationValue) * 1.5; // Moving down
    } else {
      return unit * (1 - animationValue) * 1.5; // Moving up
    }
  }
}
