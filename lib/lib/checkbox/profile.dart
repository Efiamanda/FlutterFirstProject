import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart'
    show kIsWeb; // Tambahkan untuk cek platfrom Web
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil
  String name = 'Jhon Doe';
  String bio =
      'Mahasiswa Sistem Informasi yang memiliki minat dan fokus dalam bidang Mobile Programming.'
      'Memiliki kemampuan dalam pengembangan aplikasi mobile menggunakan Flutter serta memahami dasar-dasar UI/UX, integrasi API, dan manajemen data.'
      'Aktif belajar dan mengembangkan proyek aplikasi untuk meningkatkan keterampilan teknis.';
  String location = 'Jakarta, Indonesia';
  String email = 'jhon.doe@example.com';
  String phone = '+62 123-4567-2292';
  String birthday = 'March 15, 2000';
  String occupation = 'Mobile Programmer at Universitas Pamulang';

  // State untuk gambar
  String? avatarUrl;
  XFile? pickedFile; // Gunakan XFile agar aman di Web dan Mobile

  //Data Skills
  List<String> skills = ['Flutter', 'UI/UX Design', 'Laravel', 'Figma', 'SQL'];
  Map<String, Color> skillColors = {
    'Flutter': Colors.blue,
    'UI/UX Design': Colors.purple,
    'Laravel': Colors.deepOrangeAccent,
    'Figma': Colors.pink,
    'SQL': Colors.green,
  };

  void _updateProfile(Map<String, dynamic> updatedData) {
    setState(() {
      if (updatedData['name'] != null) name = updatedData['name'];
      if (updatedData['bio'] != null) bio = updatedData['bio'];
      if (updatedData['location'] != null) location = updatedData['location'];
      if (updatedData['email'] != null) email = updatedData['email'];
      if (updatedData['phone'] != null) phone = updatedData['phone'];
      if (updatedData['birthday'] != null) birthday = updatedData['birthday'];
      if (updatedData['occupation'] != null)
        occupation = updatedData['occupation'];
      if (updatedData['avatarUrl'] != null)
        avatarUrl = updatedData['avatarUrl'];
      if (updatedData['pickedFile'] != null)
        pickedFile = updatedData['pickedFile'];
      if (updatedData['skills'] != null)
        skills = List<String>.from(updatedData['skills']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          //Cover Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1532274402911-5a369e4c4bb5?q=80&w=870&auto=format&fit=crop',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(color: Colors.indigo),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Hero(
                          tag: 'avatar',
                          child: GestureDetector(
                            onTap: () => _openEditProfileSheet(),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: _getAvatarImage(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildStatCard('Posts', '248', Icons.photo_library),
                      _buildStatCard('Followers', '12.5K', Icons.people),
                      _buildStatCard('Following', '894', Icons.person_add),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Text(
                      bio.isEmpty ? '-' : bio,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xFF4A5568),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.email, email),
                  _buildInfoRow(Icons.phone, phone),
                  _buildInfoRow(Icons.cake, birthday),
                  _buildInfoRow(Icons.work, occupation),
                  const SizedBox(height: 32),
                  const Text(
                    'Skills & Interests',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: skills.map((skill) {
                      return _buildSkillChip(
                        skill,
                        skillColors[skill] ?? Colors.grey,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _openEditProfileSheet(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF667EEA),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Profile shared!'),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF667EEA),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(
                              color: Color(0xFF667EEA),
                              width: 2,
                            ),
                          ),
                          child: const Text(
                            'Share Profile',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getAvatarImage() {
    if (pickedFile != null) {
      if (kIsWeb) {
        return NetworkImage(pickedFile!.path);
      } else {
        return FileImage(File(pickedFile!.path));
      }
    } else if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return NetworkImage(avatarUrl!);
    } else {
      return const NetworkImage(
        'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?q=80&w=387&auto=format&fit=crop',
      );
    }
  }

  void _openEditProfileSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditProfileSheet(
        currentData: {
          'name': name,
          'bio': bio,
          'location': location,
          'email': email,
          'phone': phone,
          'birthday': birthday,
          'occupation': occupation,
          'avatarUrl': avatarUrl,
          'pickedFile': pickedFile,
          'skills': skills,
        },
        onSave: _updateProfile,
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF667EEA), size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF667EEA).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF667EEA), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Color(0xFF4A5568)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}

class EditProfileSheet extends StatefulWidget {
  final Map<String, dynamic> currentData;
  final Function(Map<String, dynamic>) onSave;

  const EditProfileSheet({
    super.key,
    required this.currentData,
    required this.onSave,
  });

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController locationController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController birthdayController;
  late TextEditingController occupationController;
  late List<String> skills;
  late TextEditingController newSkillController;

  XFile? pickedFile;
  String? avatarUrl;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentData['name']);
    bioController = TextEditingController(text: widget.currentData['bio']);
    locationController = TextEditingController(
      text: widget.currentData['location'],
    );
    emailController = TextEditingController(text: widget.currentData['email']);
    phoneController = TextEditingController(text: widget.currentData['phone']);
    birthdayController = TextEditingController(
      text: widget.currentData['birthday'],
    );
    occupationController = TextEditingController(
      text: widget.currentData['occupation'],
    );
    pickedFile = widget.currentData['pickedFile'];
    avatarUrl = widget.currentData['avatarUrl'];
    skills = widget.currentData['skills'] != null
        ? List<String>.from(widget.currentData['skills'])
        : [];
    newSkillController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    locationController.dispose();
    emailController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    occupationController.dispose();
    newSkillController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? file = await _picker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (file != null) {
        setState(() {
          pickedFile = file;
          avatarUrl = null;
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    final updatedData = {
      'name': nameController.text,
      'bio': bioController.text,
      'location': locationController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'birthday': birthdayController.text,
      'occupation': occupationController.text,
      'avatarUrl': avatarUrl,
      'pickedFile': pickedFile,
      'skills': skills,
    };
    widget.onSave(updatedData);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: _saveChanges,
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildAvatarEdit(),
                  const SizedBox(height: 24),
                  _buildTextField(nameController, 'Full Name', Icons.person),
                  const SizedBox(height: 16),
                  _buildTextField(
                    locationController,
                    'Location',
                    Icons.location_on,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(emailController, 'Email', Icons.email),
                  const SizedBox(height: 16),
                  _buildTextField(phoneController, 'Phone', Icons.phone),
                  const SizedBox(height: 16),
                  _buildTextField(
                    bioController,
                    'Bio',
                    Icons.description,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 24),
                  _buildSkillsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarEdit() {
    ImageProvider image;
    if (pickedFile != null) {
      image = kIsWeb
          ? NetworkImage(pickedFile!.path)
          : FileImage(File(pickedFile!.path));
    } else if (avatarUrl != null) {
      image = NetworkImage(avatarUrl!);
    } else {
      image = const NetworkImage(
        'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?q=80&w=387&auto=format&fit=crop',
      );
    }

    return Center(
      child: Stack(
        children: [
          Hero(
            tag: 'avatar',
            child: CircleAvatar(
              radius: 50,
              backgroundImage: image,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _showImagePicker,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF667EEA),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: skills.isEmpty
              ? [Text("Belum ada skill")]
              : skills
                    .map(
                      (s) => Chip(
                        label: Text(s),
                        onDeleted: () => setState(() => skills.remove(s)),
                      ),
                    )
                    .toList(),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: newSkillController,
                decoration: const InputDecoration(hintText: 'Add skill'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (newSkillController.text.isNotEmpty) {
                  setState(() => skills.add(newSkillController.text));
                  newSkillController.clear();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
