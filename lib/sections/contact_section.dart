import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portofolio/theme/gamer_theme.dart';
import 'package:my_portofolio/widgets/glow_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;
  bool _isSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      final String name = _nameController.text;
      final String email = _emailController.text;
      final String message = _messageController.text;

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'adika.saputra.work@gmail.com',
        query: _encodeQueryParameters(<String, String>{
          'subject': 'Portfolio Quest: Message from $name',
          'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
        }),
      );

      bool success = false;
      try {
        if (await canLaunchUrl(emailLaunchUri)) {
          await launchUrl(emailLaunchUri);
          success = true;
        } else {
          debugPrint('Could not launch $emailLaunchUri');
        }
      } catch (e) {
        debugPrint('Error launching email client: $e');
      }

      setState(() {
        _isSending = false;
        _isSuccess = success;
      });

      if (success) {
        // Reset success state after a delay
        Future.delayed(const Duration(seconds: 4), () {
          if (mounted) {
            setState(() {
              _isSuccess = false;
              _nameController.clear();
              _emailController.clear();
              _messageController.clear();
            });
          }
        });
      }
    }
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width > 1200 ? 120.0 : (width > 800 ? 60.0 : 24.0),
        vertical: 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          _buildSectionHeader(),
          const SizedBox(height: 56.0),

          // Content
          isMobile
              ? Column(
                  children: [
                    _buildRecruitmentDetails(),
                    const SizedBox(height: 48.0),
                    _buildContactForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildRecruitmentDetails()),
                    const SizedBox(width: 48.0),
                    Expanded(child: _buildContactForm()),
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
              'GET IN TOUCH',
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
          'CONTACT ME',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Feel free to reach out for collaborations, job opportunities, or contract projects.',
          style: TextStyle(color: GamerColors.textSecondary, fontSize: 16.0),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildRecruitmentDetails() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AVAILABILITY & GUIDELINES',
              style: TextStyle(
                color: GamerColors.accentPink,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Currently accepting requests for high-performance mobile apps. Complete the message form to establish communication.',
              style: TextStyle(
                color: GamerColors.textSecondary,
                fontSize: 15.0,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32.0),

            // Stats grid
            _buildDetailStat(
              'CURRENT STATUS',
              'OPEN FOR OPPORTUNITIES',
              Colors.greenAccent,
            ),
            _buildDetailStat(
              'TYPICAL RESPONSE TIME',
              'WITHIN 24 HOURS',
              GamerColors.accentCyan,
            ),
            _buildDetailStat(
              'LOCAL TIMEZONE',
              'GMT+7 (WIB)',
              GamerColors.accentPurple,
            ),
            _buildDetailStat(
              'PREFERRED PLATFORMS',
              'EMAIL, LINKEDIN, TEAMS',
              Colors.white,
            ),

            const SizedBox(height: 40.0),
            const Text(
              'SOCIAL MEDIA LINKS',
              style: TextStyle(
                color: GamerColors.textSecondary,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16.0),

            // Social links buttons
            Row(
              children: [
                _buildSocialIconButton(
                  Icons.code,
                  'https://github.com/AdikaDS',
                  'GitHub',
                ),
                const SizedBox(width: 16.0),
                _buildSocialIconButton(
                  Icons.business,
                  'https://www.linkedin.com/in/adikadwis/',
                  'LinkedIn',
                ),
                const SizedBox(width: 16.0),
                _buildSocialIconButton(
                  Icons.email,
                  'mailto:adika.saputra.work@gmail.com',
                  'Email',
                ),
              ],
            ),
          ],
        )
        .animate()
        .fadeIn(delay: 200.ms, duration: 600.ms)
        .slideX(begin: -0.05, end: 0);
  }

  Widget _buildDetailStat(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '> ',
            style: TextStyle(
              color: GamerColors.accentCyan,
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Orbitron', fontSize: 13.0),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(
                      color: GamerColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyle(
                      color: valueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIconButton(IconData icon, String url, String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(color: GamerColors.accentCyan.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(8.0),
            color: GamerColors.surface,
          ),
          child: Icon(icon, color: GamerColors.accentCyan, size: 20.0),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return GlowContainer(
          glowColor: GamerColors.accentCyan,
          borderColor: GamerColors.accentCyan.withOpacity(0.3),
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SEND A MESSAGE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Fields marked with * are required.',
                  style: TextStyle(
                    color: GamerColors.textSecondary,
                    fontSize: 11.0,
                  ),
                ),
                const SizedBox(height: 24.0),

                // Name Field
                _buildTextField(
                  controller: _nameController,
                  label: 'YOUR NAME *',
                  hint: 'Enter your name or organization',
                  validator: (v) => v!.isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 20.0),

                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: 'YOUR EMAIL *',
                  hint: 'Enter contact email address',
                  validator: (v) {
                    if (v!.isEmpty) return 'Email is required';
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(v)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                // Message Field
                _buildTextField(
                  controller: _messageController,
                  label: 'YOUR MESSAGE *',
                  hint: 'Describe project details, scope or roles...',
                  maxLines: 5,
                  validator: (v) => v!.isEmpty ? 'Message is required' : null,
                ),
                const SizedBox(height: 32.0),

                // Action submit button
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ElevatedButton(
                      onPressed: (_isSending || _isSuccess)
                          ? null
                          : _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isSuccess
                            ? Colors.greenAccent
                            : GamerColors.accentCyan,
                        disabledBackgroundColor: GamerColors.surfaceSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: _isSuccess
                                ? Colors.greenAccent
                                : GamerColors.accentCyan,
                            width: 1.5,
                          ),
                        ),
                        elevation: 8.0,
                        shadowColor: GamerColors.accentCyan.withOpacity(0.5),
                      ),
                      child: _isSending
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: AlwaysStoppedAnimation(
                                  GamerColors.background,
                                ),
                              ),
                            )
                          : Text(
                              _isSuccess ? 'MESSAGE SENT!' : 'SEND MESSAGE',
                              style: TextStyle(
                                color: _isSuccess
                                    ? Colors.black
                                    : GamerColors.background,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 13.0,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(delay: 400.ms, duration: 600.ms)
        .slideX(begin: 0.05, end: 0);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: GamerColors.accentCyan,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 14.0),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: GamerColors.textSecondary.withOpacity(0.4),
              fontSize: 13.0,
            ),
            filled: true,
            fillColor: GamerColors.background,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: GamerColors.border.withOpacity(0.4),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: GamerColors.accentCyan,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: GamerColors.accentPink,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: GamerColors.accentPink,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}
