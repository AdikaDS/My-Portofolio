import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';
import 'package:my_portofolio/widgets/glow_container.dart';

class CampaignStage {
  final String stageNumber;
  final String title;
  final String organization;
  final String period;
  final List<String> details;
  final String completionReward;

  const CampaignStage({
    required this.stageNumber,
    required this.title,
    required this.organization,
    required this.period,
    required this.details,
    required this.completionReward,
  });
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<CampaignStage> stages = const [
    CampaignStage(
      stageNumber: '02',
      title: 'ANDROID DEVELOPER INTERN',
      organization: 'PT BIMASAKTI MULTI SINERGI',
      period: 'September 2024 - Desember 2024',
      details: [
        'Developed and maintained Android application features using Java, XML, and Android Studio.',
        'Translated Figma UI/ UX designs into responsive and user-friendly Android interfaces.',
        'Resolved QRIS payment system issues by fixing backend-to-UI data integration problems.',
        'Conducted feature testing and collaborated through GitLab to ensure code quality and smooth deployment.',
      ],
      completionReward:
          'Delivered and maintained Android application features, improving application stability and user experience.',
    ),
    CampaignStage(
      stageNumber: '01',
      title: 'WEB DESIGNER INTERN',
      organization: 'PT UNITED TRACTORS TBK',
      period: 'July 2023 - August 2023',
      details: [
        'Redesigned and modernized the company website UI/ UX using Figma to improve user experience and digital presence.',
        'Conducted website performance and competitor analysis to identify optimization opportunities.',
        'Collaborated on redesigning visual components and introducing new features based on usability findings.',
        'Worked closely with a mentor and team member to deliver project objectives on schedule.',
      ],
      completionReward:
          'Contributed to the successful redesign of the company website by modernizing the UI/UX and improving the user experience.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
          const SizedBox(height: 56.0),

          // Timeline layout
          _buildTimelineLayout(context, width),
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
            Container(width: 8, height: 20, color: GamerColors.accentPurple),
            const SizedBox(width: 8.0),
            const Text(
              'PROFESSIONAL EXPERIENCE',
              style: TextStyle(
                color: GamerColors.accentPurple,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          'CAREER TIMELINE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'A chronological overview of my professional experience and key accomplishments.',
          style: TextStyle(color: GamerColors.textSecondary, fontSize: 16.0),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildTimelineLayout(BuildContext context, double width) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stages.length,
      itemBuilder: (context, index) {
        final stage = stages[index];
        return Stack(
          children: [
            // The content card (with left padding to make room for the line)
            Padding(
              padding: const EdgeInsets.only(left: 62.0, bottom: 40.0),
              child:
                  GlowContainer(
                        glowColor: GamerColors.accentPurple,
                        borderColor: GamerColors.accentPurple.withValues(
                          alpha: 0.3,
                        ),
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Card Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        stage.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        stage.organization.toUpperCase(),
                                        style: const TextStyle(
                                          color: GamerColors.accentCyan,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: GamerColors.surfaceSecondary,
                                    border: Border.all(
                                      color: GamerColors.accentPink.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    stage.period,
                                    style: const TextStyle(
                                      color: GamerColors.accentPink,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),

                            // Details
                            ...stage.details.map(
                              (detail) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '> ',
                                      style: TextStyle(
                                        color: GamerColors.accentCyan,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        detail,
                                        style: const TextStyle(
                                          color: GamerColors.textSecondary,
                                          fontSize: 13.0,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),

                            // Reward / Loot Unlocked
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: GamerColors.surfaceSecondary,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: GamerColors.border.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    color: GamerColors.accentCyan,
                                    size: 16.0,
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CORE EXPERTISE GAINED:',
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.4,
                                            ),
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          stage.completionReward,
                                          style: const TextStyle(
                                            color: GamerColors.accentCyan,
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(delay: (index * 200).ms, duration: 600.ms)
                      .slideX(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
            ),

            if (index != stages.length - 1)
              Positioned(
                top: 19.0,
                bottom: 0,
                left: 19.0,
                child: Container(
                  width: 2.0,
                  color: GamerColors.accentPurple.withValues(alpha: 0.5),
                ),
              ),
            // The timeline node
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: GamerColors.background,
                  border: Border.all(
                    color: GamerColors.accentPurple,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(19.0),
                  boxShadow: [
                    BoxShadow(
                      color: GamerColors.accentPurple.withValues(alpha: 0.4),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.work_outline,
                    size: 16.0,
                    color: GamerColors.accentCyan,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
