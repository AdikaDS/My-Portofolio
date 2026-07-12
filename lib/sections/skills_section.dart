import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';
import 'package:my_portofolio/widgets/glow_container.dart';

class Skill {
  final String name;
  final double level; // 0.0 to 1.0
  final String grade; // E.g., SSS, SS, A, B
  final String logoUrl;
  final String fallbackText;

  const Skill({
    required this.name,
    required this.level,
    required this.grade,
    required this.logoUrl,
    required this.fallbackText,
  });
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Skill> mobileDevelopment = const [
    Skill(
      name: 'Kotlin',
      level: 0.85,
      grade: 'ADVANCED',
      logoUrl:
          'https://img.icons8.com/?size=100&id=ZoxjA0jZDdFZ&format=png&color=000000',
      fallbackText: 'KT',
    ),
    Skill(
      name: 'Flutter & Dart',
      level: 0.55,
      grade: 'BEGINNER',
      logoUrl:
          'https://img.icons8.com/?size=100&id=7I3BjCqe9rjG&format=png&color=000000',
      fallbackText: 'FD',
    ),
  ];

  final List<Skill> backendSkills = const [
    Skill(
      name: 'Python',
      level: 0.70,
      grade: 'INTERMEDIATE',
      logoUrl:
          'https://img.icons8.com/?size=100&id=13441&format=png&color=000000',
      fallbackText: 'PY',
    ),
    Skill(
      name: 'Firebase',
      level: 0.80,
      grade: 'ADVANCED',
      logoUrl:
          'https://img.icons8.com/?size=100&id=62452&format=png&color=000000',
      fallbackText: 'FB',
    ),
    Skill(
      name: 'MySQL',
      level: 0.70,
      grade: 'INTERMEDIATE',
      logoUrl:
          'https://img.icons8.com/?size=100&id=UFXRpPFebwa2&format=png&color=000000',
      fallbackText: 'MS',
    ),
  ];

  final List<Skill> otherSkills = const [
    Skill(
      name: 'HTML',
      level: 0.80,
      grade: 'ADVANCED',
      logoUrl:
          'https://img.icons8.com/?size=100&id=20909&format=png&color=000000',
      fallbackText: 'HT',
    ),
    Skill(
      name: 'CSS',
      level: 0.80,
      grade: 'ADVANCED',
      logoUrl:
          'https://img.icons8.com/?size=100&id=21278&format=png&color=000000',
      fallbackText: 'CS',
    ),
    Skill(
      name: 'Figma',
      level: 0.85,
      grade: 'ADVANCED',
      logoUrl:
          'https://img.icons8.com/?size=100&id=zfHRZ6i1Wg0U&format=png&color=000000',
      fallbackText: 'FG',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 850;
    final isTablet = width >= 850 && width < 1200;

    return Container(
      color: GamerColors.surface.withOpacity(0.3),
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 120.0 : (width > 800 ? 60.0 : 24.0),
        vertical: 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          _buildSectionHeader(),
          const SizedBox(height: 48.0),

          // Layout grid
          if (isMobile)
            Column(
              children: [
                _buildSkillCategory(
                  context,
                  'MOBILE DEVELOPMENT',
                  mobileDevelopment,
                  GamerColors.accentCyan,
                ),
                const SizedBox(height: 32.0),
                _buildSkillCategory(
                  context,
                  'BACK-END & DATABASE',
                  backendSkills,
                  GamerColors.accentPurple,
                ),
                const SizedBox(height: 32.0),
                _buildSkillCategory(
                  context,
                  'WEB & UI/UX DESIGN',
                  otherSkills,
                  GamerColors.accentPink,
                ),
              ],
            )
          else if (isTablet)
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildSkillCategory(
                        context,
                        'MOBILE DEVELOPMENT',
                        mobileDevelopment,
                        GamerColors.accentCyan,
                      ),
                    ),
                    const SizedBox(width: 32.0),
                    Expanded(
                      child: _buildSkillCategory(
                        context,
                        'BACK-END & DATABASE',
                        backendSkills,
                        GamerColors.accentPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: (width - 120 - 32) / 2,
                      child: _buildSkillCategory(
                        context,
                        'WEB & UI/UX DESIGN',
                        otherSkills,
                        GamerColors.accentPink,
                      ),
                    ),
                  ],
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'MOBILE DEVELOPMENT',
                    mobileDevelopment,
                    GamerColors.accentCyan,
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'BACK-END & DATABASE',
                    backendSkills,
                    GamerColors.accentPurple,
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'WEB & UI/UX DESIGN',
                    otherSkills,
                    GamerColors.accentPink,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 20, color: GamerColors.accentCyan),
            const SizedBox(width: 8.0),
            const Text(
              'MY TECHNICAL SKILLS',
              style: TextStyle(
                color: GamerColors.accentCyan,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          'EXPERTISE & TOOLKIT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'A detailed overview of the programming languages, libraries, and tools I use.',
          style: TextStyle(color: GamerColors.textSecondary, fontSize: 16.0),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String categoryName,
    List<Skill> skills,
    Color themeColor,
  ) {
    return GlowContainer(
          glowColor: themeColor,
          borderColor: themeColor.withOpacity(0.3),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: themeColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Icon(Icons.assessment, color: Colors.white24, size: 20),
                ],
              ),
              const SizedBox(height: 12.0),
              const Divider(
                color: GamerColors.surfaceSecondary,
                thickness: 1.5,
              ),
              const SizedBox(height: 16.0),
              ...skills.map(
                (skill) => _buildSkillProgress(context, skill, themeColor),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms)
        .scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOutCubic);
  }

  Widget _buildSkillProgress(
    BuildContext context,
    Skill skill,
    Color progressColor,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 500;

    final double iconSize = isMobile ? 40.0 : 48.0;
    final double iconPadding = isMobile ? 6.0 : 8.0;
    final double spacing = isMobile ? 10.0 : 16.0;
    final double nameFontSize = isMobile ? 11.0 : 13.0;
    final double levelFontSize = isMobile ? 10.0 : 11.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo Container
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: GamerColors.background,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                color: progressColor.withValues(alpha: 0.3),
                width: 1.0,
              ),
            ),
            padding: EdgeInsets.all(iconPadding),
            child: Image.network(
              skill.logoUrl,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    skill.fallbackText,
                    style: TextStyle(
                      color: progressColor,
                      fontSize: levelFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation(progressColor),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: spacing),

          // Name, Level, Progress Bar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        skill.name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isMobile)
                          Text(
                            'LEVEL: ',
                            style: TextStyle(
                              color: GamerColors.textSecondary.withValues(
                                alpha: 0.6,
                              ),
                              fontSize: 9.0,
                            ),
                          ),
                        Text(
                          skill.grade,
                          style: TextStyle(
                            color: progressColor,
                            fontSize: levelFontSize - 1.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    height: 8.0,
                    width: double.infinity,
                    color: GamerColors.surfaceSecondary,
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return FractionallySizedBox(
                              widthFactor: skill.level,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: progressColor,
                                  borderRadius: BorderRadius.circular(4.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: progressColor.withValues(
                                        alpha: 0.6,
                                      ),
                                      blurRadius: 4.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().slideX(
                              duration: 1200.ms,
                              begin: -1.0,
                              end: 0,
                              curve: Curves.easeOutCubic,
                            );
                          },
                        ),
                      ],
                    ),
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
