import 'package:flutter/material.dart';

class AchievementCard extends StatefulWidget {
  final String name;
  final String icon;
  final bool isUnlocked;
  final Color textColor;
  final Color? subtextColor;

  const AchievementCard({
    required this.name,
    required this.icon,
    required this.isUnlocked,
    required this.textColor,
    required this.subtextColor,
  });

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _hoverController.forward(),
      onExit: (_) => _hoverController.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 110,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.isUnlocked
                  ? [
                      Colors.amber[100]!,
                      Colors.orange[50]!,
                    ]
                  : [
                      Colors.grey[100]!,
                      Colors.grey[50]!,
                    ],
            ),
            border: Border.all(
              color: widget.isUnlocked
                  ? Colors.amber[200]!
                  : Colors.grey[200]!,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: (widget.isUnlocked ? Colors.amber : Colors.grey)
                    .withValues(
                  alpha: 0.1,
                ),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: (widget.isUnlocked ? Colors.amber : Colors.grey)
                    .withValues(
                  alpha: 0.05,
                ),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: widget.isUnlocked ? 1.0 : 0.4,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  widget.icon,
                  style: const TextStyle(fontSize: 44),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: widget.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    height: 1.1,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.isUnlocked
                      ? Colors.green[50]
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: widget.isUnlocked
                        ? Colors.green[200]!
                        : Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Text(
                  widget.isUnlocked ? '✓' : '🔒',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: widget.isUnlocked
                        ? Colors.green[700]
                        : Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
