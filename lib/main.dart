import 'package:flutter/material.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';
import 'package:my_portofolio/widgets/navbar.dart';
import 'package:my_portofolio/sections/hero_section.dart';
import 'package:my_portofolio/sections/skills_section.dart';
import 'package:my_portofolio/sections/projects_section.dart';
import 'package:my_portofolio/sections/experience_section.dart';
import 'package:my_portofolio/sections/contact_section.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A.D.S | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: GamerTheme.darkTheme,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  int _activeIndex = 0;

  // Global Keys for scrolling to specific sections
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late final List<GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = [
      _heroKey,
      _skillsKey,
      _projectsKey,
      _experienceKey,
      _contactKey,
    ];
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Determine which section is currently active based on offset
    double currentOffset = _scrollController.offset;
    int index = 0;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final key = _sectionKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox != null) {
          final position = renderBox.localToGlobal(Offset.zero);
          final absoluteY = position.dy + currentOffset;

          // If the section is scrolled past the top (with offset allowance for navbar)
          if (currentOffset >= absoluteY - 150) {
            index = i;
          }
        }
      }
    }

    if (index != _activeIndex) {
      setState(() {
        _activeIndex = index;
      });
    }
  }

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
      setState(() {
        _activeIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GamerColors.background,
      endDrawer: GamerEndDrawer(
        activeIndex: _activeIndex,
        onMenuItemTap: _scrollToSection,
      ),
      body: Stack(
        children: [
          // Content Layout
          Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Spacer to push content down under the floating navbar
                  const SizedBox(height: 70.0),

                  // Hero Section
                  Container(
                    key: _heroKey,
                    child: HeroSection(
                      onStartQuestsTap: () => _scrollToSection(2), // Quests
                      onJoinPartyTap: () =>
                          _scrollToSection(4), // Party (Contact)
                    ),
                  ),

                  // Skills Section
                  Container(key: _skillsKey, child: const SkillsSection()),

                  // Projects Section
                  Container(key: _projectsKey, child: const ProjectsSection()),

                  // Experience Section
                  Container(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),

                  // Contact Section
                  Container(key: _contactKey, child: const ContactSection()),

                  // Footer Section
                  _buildFooter(context),
                ],
              ),
            ),
          ),

          // Transparent/Glass Navigation Bar floating on top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              activeIndex: _activeIndex,
              onMenuItemTap: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: GamerColors.surfaceSecondary, width: 1.5),
        ),
        color: GamerColors.surface,
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'LET\'S BUILD SOMETHING UNIQUE TOGETHER',
              style: TextStyle(
                color: GamerColors.accentPink,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              '© ${DateTime.now().year} Adika Dwi Saputra. SHIPPED WITH FLUTTER WEB.',
              style: const TextStyle(
                color: GamerColors.textSecondary,
                fontSize: 10.0,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'BUGS RESOLVED: 1000+ | TEST COVERAGE: 92% | UPTIME: 99.9%',
              style: TextStyle(
                color: GamerColors.accentCyan.withValues(alpha: 0.6),
                fontSize: 9.0,
                fontFamily: 'monospace',
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
