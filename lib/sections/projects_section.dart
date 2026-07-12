import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';
import 'package:my_portofolio/widgets/glow_container.dart';
import 'package:url_launcher/url_launcher.dart';

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String category;
  final String reward;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.category,
    required this.reward,
    this.githubUrl,
    this.liveUrl,
  });
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _activeFilter = 'ALL';

  final List<Project> projects = const [
    Project(
      title: 'Redesign Website Windsight',
      description:
          'Redesigned the Windsight company website by creating a modern, user-centered interface in Figma, supported by competitor research and usability analysis to enhance the overall user experience.',
      tags: ['FIGMA'],
      category: 'UI/UX',
      reward:
          'Delivered a modern, user-centered website redesign with high-fidelity prototypes, improving visual consistency and usability.',
      liveUrl:
          'https://www.figma.com/design/Yj90uYCW9tJlYFgA0T0nTt/PAD?node-id=0-1&t=nQji22rqhk4aLYiV-1',
    ),
    Project(
      title: 'Redesign Website SIM Klinik Konstruksi',
      description:
          'Designed the UI/UX for the SIM Klinik Konstruksi website using Figma, creating a modern and user-centered interface to streamline access to construction consultation and information services. Conducted user flow planning, wireframing, high-fidelity prototyping, and responsive interface design to ensure an intuitive user experience.',
      tags: ['FIGMA'],
      category: 'UI/UX',
      reward:
          'Delivered development-ready UI/UX designs that streamlined the user journey and improved interface consistency.',
      liveUrl:
          'https://www.figma.com/design/cp8v4o12lpNT420spZdzQi/Redesain-SIM-KLINIK-Konstruksi?node-id=2-2&t=EvPQ5OihGM7kzc8z-1',
    ),
    Project(
      title: 'Revitalization Website PT United Tractors Tbk',
      description:
          'Led a comprehensive website revitalization for PT United Tractors Tbk, involving user journey mapping, competitor analysis, and the creation of a modern, intuitive interface. The redesign focused on improving content accessibility and user engagement through streamlined navigation and improved visual hierarchy.',
      tags: ['FIGMA'],
      category: 'UI/UX',
      reward:
          'Delivered development-ready UI/UX designs that streamlined the user journey and improved interface consistency.',
      liveUrl:
          'https://www.figma.com/design/WOStleWALISUUziQsQhJl9/PI-United-Tractors?node-id=0-1&t=Io0zKxTd6omhraQW-1',
    ),
    Project(
      title: 'Design App ArtiQuest Bangkit Project ',
      description:
          'Designed the UI/UX for ArtiQuest, a cultural heritage mobile application, by creating user flows, wireframes, and high-fidelity prototypes in collaboration with a cross-functional team.',
      tags: ['FIGMA'],
      category: 'UI/UX',
      reward:
          'Delivered development-ready UI/UX designs with a consistent and user-centered experience.',
      liveUrl:
          'https://www.figma.com/design/KEo0b6THIBgicNjY3GKinr/ArtiQuest-Bangkit?node-id=0-1&t=yfj3WmIKd2HDFpsc-1',
    ),
    Project(
      title: 'Mobile App ArtiQuest',
      description:
          'Developed ArtiQuest, an Android application that centralizes information on Indonesia\'s cultural heritage, by implementing core features, integrating REST APIs, and collaborating with cross-functional teams.',
      tags: ['ANDROID STUDIO, KOTLIN, FIREBASE'],
      category: 'MOBILE',
      reward:
          'Delivered a functional Android application with AI-powered artifact recognition and seamless backend integration.',
      githubUrl: 'https://github.com/AdikaDS/ArtiQuest',
    ),
    Project(
      title: 'Mobile App Almutasetra',
      description:
          'Developed Almutasetra, an Android educational application that introduces Indonesia\'s traditional musical instruments, dances, and weapons through interactive learning content and an intuitive user interface.',
      tags: ['ANDROID STUDIO, KOTLIN, FIREBASE'],
      category: 'MOBILE',
      reward:
          'Delivered a functional Android application with intuitive navigation and engaging educational content.',
      githubUrl: 'https://github.com/AdikaDS/Almutasetra',
    ),
    Project(
      title: 'Mobile App LearnAble',
      description:
          'Developed LearnAble, an Android educational application that supports children with hearing impairments through interactive learning features, secure authentication, and cloud-based data management.',
      tags: ['ANDROID STUDIO, KOTLIN, FIREBASE, API'],
      category: 'MOBILE',
      reward:
          'Delivered a functional Android learning application with secure authentication, cloud-based data management, and an accessible user experience.',
      githubUrl: 'https://github.com/AdikaDS/LearnAble-Project',
    ),
  ];

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Filter projects
    final filteredProjects = projects.where((p) {
      if (_activeFilter == 'ALL') return true;
      return p.category == _activeFilter;
    }).toList();

    // Responsive columns
    int crossAxisCount = 3;
    if (width < 750) {
      crossAxisCount = 1;
    } else if (width < 1100) {
      crossAxisCount = 2;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 120.0 : (width > 800 ? 60.0 : 24.0),
        vertical: 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          _buildSectionHeader(),
          const SizedBox(height: 32.0),

          // Filters
          _buildFilters(),
          const SizedBox(height: 48.0),

          // Projects Grid
          Column(
            children: [
              for (
                int rowIndex = 0;
                rowIndex < (filteredProjects.length / crossAxisCount).ceil();
                rowIndex++
              ) ...[
                if (rowIndex > 0) const SizedBox(height: 24.0),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (
                        int colIndex = 0;
                        colIndex < crossAxisCount;
                        colIndex++
                      ) ...[
                        if (colIndex > 0) const SizedBox(width: 24.0),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final index =
                                  rowIndex * crossAxisCount + colIndex;
                              if (index >= filteredProjects.length) {
                                return const SizedBox();
                              }
                              final project = filteredProjects[index];
                              return _buildProjectCard(project)
                                  .animate()
                                  .fadeIn(
                                    delay: (index * 150).ms,
                                    duration: 500.ms,
                                  )
                                  .slideY(
                                    begin: 0.1,
                                    end: 0,
                                    curve: Curves.easeOutQuad,
                                  );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
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
            Container(width: 8, height: 20, color: GamerColors.accentPink),
            const SizedBox(width: 8.0),
            const Text(
              'PORTFOLIO & VENTURES',
              style: TextStyle(
                color: GamerColors.accentPink,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          'PROJECTS LOG',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Browse my recent projects, including client work and open-source contributions.',
          style: TextStyle(color: GamerColors.textSecondary, fontSize: 16.0),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildFilters() {
    final filterOptions = ['ALL', 'MOBILE', 'UI/UX'];
    return Row(
      children: filterOptions.map((filter) {
        final isActive = _activeFilter == filter;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _activeFilter = filter;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12.0, bottom: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: isActive ? GamerColors.accentPink : GamerColors.surface,
                border: Border.all(
                  color: isActive
                      ? GamerColors.accentPink
                      : GamerColors.border.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isActive ? GamerColors.background : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildProjectCard(Project project) {
    return GlowContainer(
      glowColor: GamerColors.accentPink,
      borderColor: GamerColors.accentPink.withOpacity(0.3),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header / Quest status badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: GamerColors.accentCyan),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  project.category,
                  style: const TextStyle(
                    color: GamerColors.accentCyan,
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 14.0),
                  SizedBox(width: 4.0),
                  Text(
                    'COMPLETED',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Title
          Text(
            project.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),

          // Description
          Expanded(
            child: Text(
              project.description,
              style: const TextStyle(
                color: GamerColors.textSecondary,
                fontSize: 13.0,
                height: 1.5,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16.0),

          // Tags Row
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: project.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.0,
                ),
                color: GamerColors.surfaceSecondary,
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: GamerColors.textSecondary,
                    fontSize: 9.0,
                    fontFamily: 'monospace',
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16.0),

          // Reward text
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: GamerColors.accentPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star_border,
                  color: GamerColors.accentPurple,
                  size: 14,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'OUTCOME: ${project.reward}',
                    style: const TextStyle(
                      color: GamerColors.accentPurple,
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Footer Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (project.githubUrl != null)
                IconButton(
                  icon: const Icon(Icons.code, color: Colors.white, size: 20.0),
                  tooltip: 'View Code',
                  onPressed: () => _launchURL(project.githubUrl!),
                ),
              if (project.liveUrl != null)
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    color: GamerColors.accentPink,
                    size: 22.0,
                  ),
                  tooltip: 'Live Demo',
                  onPressed: () => _launchURL(project.liveUrl!),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
