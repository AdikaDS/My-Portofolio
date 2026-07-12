import 'package:flutter/material.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';

class GlowContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color borderColor;
  final Color glowColor;
  final double borderRadius;
  final double borderWidth;
  final VoidCallback? onTap;

  const GlowContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor = GamerColors.surface,
    this.borderColor = GamerColors.border,
    this.glowColor = GamerColors.accentCyan,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.onTap,
  });

  @override
  State<GlowContainer> createState() => _GlowContainerState();
}

class _GlowContainerState extends State<GlowContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final showGlow = _isHovered;

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          transform: Matrix4.identity()
            ..translate(0.0, showGlow ? -6.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: showGlow ? widget.glowColor : widget.borderColor,
              width: widget.borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: showGlow
                    ? widget.glowColor.withOpacity(0.35)
                    : Colors.black.withOpacity(0.2),
                blurRadius: showGlow ? 16.0 : 6.0,
                spreadRadius: showGlow ? 2.0 : 0.0,
                offset: showGlow ? const Offset(0, 4) : const Offset(0, 2),
              ),
              if (showGlow)
                BoxShadow(
                  color: widget.glowColor.withOpacity(0.15),
                  blurRadius: 30.0,
                  spreadRadius: 8.0,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius - widget.borderWidth),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
