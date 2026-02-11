import 'package:flutter/material.dart';
import '../core/colors.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String selectedTab = 'Primary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '3arthen',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.auto_graph, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.white, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Pills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildTabPill('Primary', 5),
                const SizedBox(width: 8),
                _buildTabPill('General', null),
                const SizedBox(width: 8),
                _buildTabPill('Requests', null),
              ],
            ),
          ),

          // Chat List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: _getChatData().length,
              itemBuilder: (context, index) {
                final chat = _getChatData()[index];
                return _ChatListItem(chat: chat);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabPill(String title, int? count) {
    final isSelected = selectedTab == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFF262626),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (count != null && isSelected) ...[
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF3797EF),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey[400],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 15,
              ),
            ),
            if (count != null && isSelected) ...[
              const SizedBox(width: 6),
              Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getChatData() {
    return [
      {
        'username': 'p3rspective.siso',
        'profileImage': 'https://i.pravatar.cc/150?img=1',
        'message': '',
        'status': 'Active yesterday',
        'hasStory': false,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'brayen',
        'profileImage': 'https://i.pravatar.cc/150?img=2',
        'message': '2 new messages',
        'status': '3d',
        'hasStory': false,
        'unreadCount': 2,
        'showCamera': true,
      },
      {
        'username': 'Rio Stephen Tjiandra',
        'profileImage': 'https://i.pravatar.cc/150?img=3',
        'message': '',
        'status': 'Active now',
        'hasStory': true,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'MASI Exclusive Content',
        'profileImage': 'https://i.pravatar.cc/150?img=4',
        'message': '4+ new messages',
        'status': '5d',
        'hasStory': false,
        'unreadCount': 4,
        'showCamera': false,
      },
      {
        'username': 'Rita Stock and Random Talk 📣',
        'profileImage': 'https://i.pravatar.cc/150?img=5',
        'message': '4+ new messages',
        'status': '6d',
        'hasStory': false,
        'unreadCount': 4,
        'showCamera': false,
      },
      {
        'username': 'Hafizh Nouval',
        'profileImage': 'https://i.pravatar.cc/150?img=6',
        'message': '',
        'status': 'Active 7m ago',
        'hasStory': false,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'eevs.indonesia',
        'profileImage': 'https://i.pravatar.cc/150?img=7',
        'message': '',
        'status': 'Active 16m ago',
        'hasStory': true,
        'isVerified': true,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'Taman Wisata Candi Prambanan',
        'profileImage': 'https://i.pravatar.cc/150?img=8',
        'message': 'Hai, loket buka setiap hari puk...',
        'status': '1w',
        'hasStory': true,
        'isVerified': true,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'borobudurpark',
        'profileImage': 'https://i.pravatar.cc/150?img=9',
        'message': 'Hai, loket buka setiap hari pad...',
        'status': '1w',
        'hasStory': true,
        'isVerified': true,
        'unreadCount': 0,
        'showCamera': true,
      },
      {
        'username': 'meryyyy.official',
        'profileImage': 'https://i.pravatar.cc/150?img=10',
        'message': '',
        'status': '',
        'hasStory': false,
        'unreadCount': 1,
        'showCamera': true,
      },
    ];
  }
}

// Reusable Chat List Item Component
class _ChatListItem extends StatelessWidget {
  final Map<String, dynamic> chat;

  const _ChatListItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              username: chat['username'],
              profileImage: chat['profileImage'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Profile Picture with Story Border
            _ProfileAvatar(
              imageUrl: chat['profileImage'],
              hasStory: chat['hasStory'] ?? false,
              size: 56,
            ),
            const SizedBox(width: 12),

            // Chat Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Username with verified badge
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          chat['username'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat['isVerified'] == true) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: Color(0xFF3797EF),
                          size: 14,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Message or Status
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['message'].isEmpty
                              ? chat['status']
                              : '${chat['message']} • ${chat['status']}',
                          style: TextStyle(
                            color: chat['unreadCount'] > 0
                                ? Colors.white
                                : Colors.grey[500],
                            fontSize: 14,
                            fontWeight: chat['unreadCount'] > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Right Side (Unread indicator or Camera icon)
            const SizedBox(width: 12),
            if (chat['unreadCount'] > 0)
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF3797EF),
                  shape: BoxShape.circle,
                ),
              )
            else if (chat['showCamera'] == true)
              const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

// Reusable Profile Avatar Component with Story Border
class _ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool hasStory;
  final double size;

  const _ProfileAvatar({
    required this.imageUrl,
    required this.hasStory,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: hasStory
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFF58529),
                  Color(0xFFDD2A7B),
                  Color(0xFF8134AF),
                ],
              )
            : null,
      ),
      padding: hasStory ? const EdgeInsets.all(2.5) : null,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        padding: hasStory ? const EdgeInsets.all(2.5) : null,
        child: CircleAvatar(
          radius: size / 2,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.grey[800],
        ),
      ),
    );
  }
}

// Chat Detail Screen
class ChatDetailScreen extends StatelessWidget {
  final String username;
  final String profileImage;

  const ChatDetailScreen({
    super.key,
    required this.username,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
              radius: 16,
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 50,
                    backgroundColor: Colors.grey[800],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Instagram • @${username.toLowerCase().replaceAll(' ', '_')}',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF262626),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'View profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Message Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(top: BorderSide(color: Colors.grey[900]!)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Camera Button
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3797EF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Message Input Field
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF262626),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey[800]!, width: 1),
                      ),
                      child: Text(
                        'Message...',
                        style: TextStyle(color: Colors.grey[500], fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Voice Message Button
                  Icon(Icons.mic, color: Colors.grey[400], size: 26),
                  const SizedBox(width: 12),

                  // Image/Gallery Button
                  Icon(Icons.image, color: Colors.grey[400], size: 26),
                  const SizedBox(width: 4),

                  // Sticker Button
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey[400],
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
