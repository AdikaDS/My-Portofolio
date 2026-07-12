import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onMenuItemTap;
  final List<String> menuItems = const [
    'HOME',
    'SKILLS',
    'PROJECTS',
    'EXPERIENCE',
    'CONTACT',
  ];
  final int activeIndex;

  const Navbar({super.key, required this.onMenuItemTap, this.activeIndex = 0});

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
        child: Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            color: GamerColors.background.withOpacity(0.7),
            border: const Border(
              bottom: BorderSide(color: GamerColors.accentCyan, width: 1.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo / Gamer Tag
              GestureDetector(
                onTap: () => onMenuItemTap(0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: GamerColors.accentCyan),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Text(
                          'ADS',
                          style: TextStyle(
                            color: GamerColors.accentCyan,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'My Portofolio',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width < 400 ? 14.0 : 18.0,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Menu Items
              if (!isMobile)
                Row(
                  children: List.generate(menuItems.length, (index) {
                    final item = menuItems[index];
                    final isActive = activeIndex == index;
                    return _NavbarButton(
                      title: item,
                      isActive: isActive,
                      onTap: () => onMenuItemTap(index),
                    );
                  }),
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: GamerColors.accentCyan),
                  onPressed: () {
                    // Open drawer in scaffold
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavbarButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavbarButton({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<_NavbarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.isActive ? GamerColors.accentCyan : Colors.white;
    final hoverColor = GamerColors.accentCyan.withOpacity(0.8);
    final displayColor = _isHovered ? hoverColor : activeColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.isActive
                    ? GamerColors.accentCyan
                    : (_isHovered
                          ? GamerColors.accentCyan.withOpacity(0.5)
                          : Colors.transparent),
                width: 2.0,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: displayColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              letterSpacing: 1.0,
              shadows: widget.isActive || _isHovered
                  ? [
                      Shadow(
                        color: GamerColors.accentCyan.withOpacity(0.5),
                        blurRadius: 8.0,
                      ),
                    ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

class GamerEndDrawer extends StatelessWidget {
  final Function(int) onMenuItemTap;
  final List<String> menuItems = const [
    'HOME',
    'SKILLS',
    'PROJECTS',
    'EXPERIENCE',
    'CONTACT',
  ];
  final int activeIndex;

  const GamerEndDrawer({
    super.key,
    required this.onMenuItemTap,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: GamerColors.background.withOpacity(0.95),
      child: Container(
        decoration: BoxDecoration(
          border: const Border(
            left: BorderSide(color: GamerColors.accentCyan, width: 2.0),
          ),
          boxShadow: [
            BoxShadow(
              color: GamerColors.accentCyan.withOpacity(0.1),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'NAVIGATION',
                      style: TextStyle(
                        color: GamerColors.accentCyan,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: GamerColors.accentCyan,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(color: GamerColors.border, thickness: 1.0),
              const SizedBox(height: 16.0),
              ...List.generate(menuItems.length, (index) {
                final item = menuItems[index];
                final isActive = activeIndex == index;
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 8.0,
                  ),
                  title: Text(
                    item,
                    style: TextStyle(
                      color: isActive ? GamerColors.accentCyan : Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: isActive
                      ? const Icon(
                          Icons.arrow_forward_ios,
                          color: GamerColors.accentCyan,
                          size: 16.0,
                        )
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    onMenuItemTap(index);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
