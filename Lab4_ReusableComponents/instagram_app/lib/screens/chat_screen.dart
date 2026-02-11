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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '3arthen',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 4),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 18,
                ),
                Positioned(
                  top: 0,
                  right: -4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Ikon Kanan Atas
        actions: [
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            icon: const Icon(Icons.more_horiz, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            icon: const Icon(Icons.auto_graph, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.only(left: 8, right: 16),
            icon: const Icon(Icons.edit_square, color: Colors.white, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Pills (Primary, General, Requests)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              padding: const EdgeInsets.only(top: 4),
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

  // Widget Tab Pill yang diperbarui
  Widget _buildTabPill(String title, int? count) {
    final isSelected = selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFF262626),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (count != null && isSelected) ...[
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3797EF),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey[400],
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              if (count != null) ...[
                const SizedBox(width: 4),
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey[400],
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Username
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          chat['username'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: chat['unreadCount'] > 0
                                ? FontWeight.bold
                                : FontWeight.w400,
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

                  const SizedBox(height: 2),

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
                            fontSize: 13,
                            fontWeight: chat['unreadCount'] > 0
                                ? FontWeight.w700
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

            const SizedBox(width: 12),
            if (chat['unreadCount'] > 0)
              Container(
                width: 8,
                height: 8,
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
      appBar: AppBar(title: Text(username)),
      body: Center(child: Text("Chat with $username")),
    );
  }
}
