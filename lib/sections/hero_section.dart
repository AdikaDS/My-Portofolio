import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onStartQuestsTap;
  final VoidCallback onJoinPartyTap;

  const HeroSection({
    super.key,
    required this.onStartQuestsTap,
    required this.onJoinPartyTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 950;

    return Container(
      constraints: const BoxConstraints(minHeight: 800),
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 120.0 : (width > 800 ? 60.0 : 24.0),
        vertical: 80.0,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIntroContent(context),
                const SizedBox(height: 48.0),
                Center(child: _buildLargeProfileImage(context, width)),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _buildIntroContent(context)),
                const SizedBox(width: 48.0),
                Expanded(
                  child: Center(child: _buildLargeProfileImage(context, width)),
                ),
              ],
            ),
    );
  }

  Widget _buildIntroContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CLI prompt style intro
        Row(
              children: [
                const Text(
                  'C:\\> ',
                  style: TextStyle(
                    color: GamerColors.accentCyan,
                    fontFamily: 'monospace',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'RUN INITIALIZE_PORTFOLIO.EXE',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideX(begin: -0.2, end: 0, curve: Curves.easeOutQuad),
        const SizedBox(height: 24.0),

        // Welcome / Heading
        const Text(
              'WELCOME TO THE PORTFOLIO OF',
              style: TextStyle(
                color: GamerColors.accentPink,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 8.0),

        // Gamer Tag / Name
        ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [GamerColors.accentCyan, GamerColors.accentPurple],
              ).createShader(bounds),
              child: const Text(
                'Adika Dwi Saputra',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms)
            .scale(begin: const Offset(0.9, 0.9)),
        const SizedBox(height: 12.0),

        // Subtitle / Class
        Row(
              children: [
                const Text(
                  'ROLE: ',
                  style: TextStyle(
                    color: GamerColors.textSecondary,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  color: GamerColors.accentCyan.withOpacity(0.2),
                  child: const Text(
                    'Mobile Developer',
                    style: TextStyle(
                      color: GamerColors.accentCyan,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            )
            .animate()
            .fadeIn(delay: 600.ms, duration: 600.ms)
            .slideX(begin: 0.2, end: 0),
        const SizedBox(height: 24.0),

        // Description
        const Text(
          'I build modern Android applications with clean architecture and intuitive UI/UX, delivering scalable, high-performance, and user-centered mobile experiences.',
          style: TextStyle(fontSize: 16.0, height: 1.6),
        ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
        const SizedBox(height: 40.0),

        // CTA Buttons
        Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildNeonButton(
                  label: 'VIEW PROJECTS',
                  color: GamerColors.accentCyan,
                  onPressed: onStartQuestsTap,
                ),
                _buildNeonButton(
                  label: 'GET IN TOUCH',
                  color: GamerColors.accentPink,
                  isOutlined: true,
                  onPressed: onJoinPartyTap,
                ),
              ],
            )
            .animate()
            .fadeIn(delay: 1000.ms, duration: 600.ms)
            .slideY(begin: 0.4, end: 0),
      ],
    );
  }

  Widget _buildNeonButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
    bool isOutlined = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: isOutlined ? Colors.transparent : color,
            border: Border.all(color: color, width: 2.0),
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(isOutlined ? 0.1 : 0.4),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isOutlined ? color : GamerColors.background,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRPGStatBar({
    required String label,
    required double value,
    required Color color,
    required String textValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              textValue,
              style: TextStyle(
                color: color,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            height: 12.0,
            width: double.infinity,
            color: GamerColors.surfaceSecondary,
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      width: constraints.maxWidth * value,
                      decoration: BoxDecoration(
                        color: color,
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.6),
                            blurRadius: 6.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLargeProfileImage(BuildContext context, double screenWidth) {
    final imageSize = screenWidth > 1200
        ? 360.0
        : (screenWidth > 500 ? 300.0 : screenWidth - 64.0);

    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Large profile image with glowing background circle
            Stack(
              alignment: Alignment.center,
              children: [
                // Cyberpunk Glow Circles behind photo
                Container(
                      width: imageSize,
                      height: imageSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: SweepGradient(
                          colors: [
                            GamerColors.accentPurple,
                            GamerColors.accentPink,
                            GamerColors.accentCyan,
                            GamerColors.accentPurple,
                          ],
                          stops: const [0.0, 0.35, 0.7, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: GamerColors.accentPurple.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 40.0,
                            spreadRadius: 10.0,
                          ),
                          BoxShadow(
                            color: GamerColors.accentPink.withValues(
                              alpha: 0.2,
                            ),
                            blurRadius: 20.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat())
                    .rotate(duration: 8.seconds),

                // Inner dark circle to create a border gap
                Container(
                  width: imageSize - 8.0,
                  height: imageSize - 8.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: GamerColors.background,
                  ),
                ),

                // The main profile image cropped as a circle
                Container(
                  width: imageSize - 16.0,
                  height: imageSize - 16.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: GamerColors.surface,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/my_profile.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.person,
                            size: imageSize * 0.4,
                            color: GamerColors.accentCyan,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Futuristic HUD overlay rings
                Container(
                      width: imageSize + 24.0,
                      height: imageSize + 24.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: GamerColors.accentCyan.withValues(alpha: 0.4),
                          width: 1.5,
                        ),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .scaleXY(
                      begin: 0.98,
                      end: 1.02,
                      duration: 2.seconds,
                      curve: Curves.easeInOutQuad,
                    ),
              ],
            ),
            const SizedBox(height: 32.0),

            // Compact RPG Stat Card underneath the image
            Container(
                  width: imageSize + 24.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: GamerColors.surface,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: GamerColors.accentPurple.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 12.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'ADS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: GamerColors.accentPink),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Text(
                              'LVL 5+',
                              style: TextStyle(
                                color: GamerColors.accentPink,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      _buildRPGStatBar(
                        label: 'PROBLEM SOLVING',
                        value: 0.85,
                        color: Colors.greenAccent,
                        textValue: '85%',
                      ),
                      const SizedBox(height: 8.0),
                      _buildRPGStatBar(
                        label: 'CREATIVITY',
                        value: 0.85,
                        color: GamerColors.accentCyan,
                        textValue: '85%',
                      ),
                      const SizedBox(height: 8.0),
                      _buildRPGStatBar(
                        label: 'WORK ETHIC',
                        value: 0.95,
                        color: GamerColors.accentCyan,
                        textValue: '95%',
                      ),
                      const SizedBox(height: 8.0),
                      _buildRPGStatBar(
                        label: 'TEAMWORK',
                        value: 0.95,
                        color: GamerColors.accentCyan,
                        textValue: '95%',
                      ),
                      const SizedBox(height: 8.0),
                      _buildRPGStatBar(
                        label: 'ADAPTABILITY',
                        value: 0.90,
                        color: GamerColors.accentCyan,
                        textValue: '90%',
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(delay: 700.ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
          ],
        )
        .animate()
        .fadeIn(delay: 500.ms, duration: 800.ms)
        .scale(begin: const Offset(0.9, 0.9), curve: Curves.easeOutBack);
  }
}
