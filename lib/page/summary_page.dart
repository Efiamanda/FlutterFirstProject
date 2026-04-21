import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  // Harry Potter Theme Colors
  static const Color primaryGold = Color(0xFFD4AF37);
  static const Color maroonDark = Color(0xFF740001);
  static const Color darkBg = Color(0xFF0F1419);
  static const Color cardBg = Color(0xFF1a1f2e);
  static const Color textLight = Color(0xFFE8E3D3);

  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: darkBg,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Profile Summary',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryGold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Overview of your wizarding journey',
              style: TextStyle(
                fontSize: 14,
                color: textLight.withOpacity(0.6),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 28),

            // Statistics Card
            _buildSummaryCard(
              title: 'Statistics',
              children: [
                _buildStatRow(
                  label: 'Total Followers',
                  value: '12,543',
                  icon: Icons.people,
                ),
                _buildStatRow(
                  label: 'Total Likes',
                  value: '4,234',
                  icon: Icons.favorite,
                ),
                _buildStatRow(label: 'Posts', value: '47', icon: Icons.article),
                _buildStatRow(
                  label: 'Joined',
                  value: 'September 2024',
                  icon: Icons.calendar_today,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // About Section
            _buildSummaryCard(
              title: 'About Me',
              children: [
                Text(
                  'A passionate wizard from Gryffindor House, dedicated to exploring the depths of magical knowledge and protecting the wizarding world. Specializing in advanced spellwork and mentoring young practitioners.',
                  style: TextStyle(fontSize: 14, color: textLight, height: 1.6),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Skills Section
            _buildSummaryCard(
              title: 'Magical Specialties',
              children: [
                _buildSkillTag('Defensive Spells'),
                _buildSkillTag('Transfiguration'),
                _buildSkillTag('Herbology'),
                _buildSkillTag('Dueling'),
                _buildSkillTag('Leadership'),
                _buildSkillTag('Teaching'),
              ],
            ),
            const SizedBox(height: 20),

            // Activities Section
            _buildSummaryCard(
              title: 'Recent Activities',
              children: [
                _buildActivityItem(
                  title: 'Mastered Advanced Patronus Charm',
                  date: '3 days ago',
                  icon: Icons.star,
                ),
                _buildActivityItem(
                  title: 'Mentored 5 Young Wizards',
                  date: '1 week ago',
                  icon: Icons.school,
                ),
                _buildActivityItem(
                  title: 'Participated in Wizard Tournament',
                  date: '2 weeks ago',
                  icon: Icons.emoji_events,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: primaryGold.withOpacity(0.5), width: 1.5),
        color: cardBg,
        boxShadow: [
          BoxShadow(
            color: maroonDark.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: primaryGold,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildStatRow({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: primaryGold, size: 18),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: textLight.withOpacity(0.8),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: primaryGold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTag(String skill) {
    return Padding(
      padding: EdgeInsets.only(right: 10, bottom: 10),
      child: Chip(
        label: Text(
          skill,
          style: TextStyle(
            color: maroonDark,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        backgroundColor: primaryGold,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: primaryGold, width: 0),
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String date,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: maroonDark.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: primaryGold.withOpacity(0.3)),
            ),
            child: Icon(icon, color: primaryGold, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: textLight,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: textLight.withOpacity(0.5),
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
