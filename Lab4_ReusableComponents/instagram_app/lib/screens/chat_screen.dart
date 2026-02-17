import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../core/constants.dart';

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
      backgroundColor: AppColors.mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mobileBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '3arthen',
              style: TextStyle(
                color: AppColors.whiteColor,
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
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
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
            color: isSelected ? AppColors.whiteColor : AppColors.darkGreyColor,
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
                    color: AppColors.blueColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? AppColors.blackColor : AppColors.greyColor,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              if (count != null) ...[
                const SizedBox(width: 4),
                Text(
                  count.toString(),
                  style: TextStyle(
                    color: isSelected ? AppColors.blackColor : AppColors.greyColor,
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
                            color: AppColors.whiteColor,
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
                          color: AppColors.blueColor,
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
                                ? AppColors.whiteColor
                                : AppColors.greyColor,
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
                  color: AppColors.blueColor,
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
                colors: AppColors.storyBorderColor,
              )
            : null,
      ),
      padding: hasStory ? const EdgeInsets.all(2.5) : null,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.blackColor,
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
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(title: Text(username)),
      body: Center(child: Text("Chat with $username")),
    );
  }
}
