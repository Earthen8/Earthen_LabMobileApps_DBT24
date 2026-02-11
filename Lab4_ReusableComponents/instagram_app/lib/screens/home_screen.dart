import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double storyItemWidth = screenWidth / 3.5;
    final double storyCircleRadius = (storyItemWidth - 20) / 2;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        // 1. Tombol + di Ujung Kiri
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white, size: 32),
        ),

        // 2. Tulisan Instagram di Tengah
        title: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2560px-Instagram_logo.svg.png',
          height: 32,
          color: Colors.white,
        ),

        // 3. Simbol Hati di Kanan Atas
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Stories Section ---
            SizedBox(
              height: storyItemWidth + 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: _getStories().length,
                itemBuilder: (context, index) {
                  final story = _getStories()[index];
                  return SizedBox(
                    width: storyItemWidth,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: storyCircleRadius * 2 + 6,
                              height: storyCircleRadius * 2 + 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: index == 0
                                    ? null
                                    : const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xFFC913B9),
                                          Color(0xFFF9373F),
                                          Color(0xFFFECD00),
                                        ],
                                      ),
                              ),
                            ),
                            // Black Border & Image
                            Container(
                              width: storyCircleRadius * 2,
                              height: storyCircleRadius * 2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  story['imageUrl'],
                                ),
                              ),
                            ),
                            // Plus Badge for User
                            if (index == 0)
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xFF0095F6),
                                    child: Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Username Text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            story['username'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.white10, height: 1),

            // --- Posts Section ---
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _getPosts().length,
              itemBuilder: (context, index) {
                return PostItem(post: _getPosts()[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Mock Data ---
  List<Map<String, dynamic>> _getStories() => [
    {'username': 'Your story', 'imageUrl': 'https://i.pravatar.cc/150?img=60'},
    {'username': 'prabowo', 'imageUrl': 'https://i.pravatar.cc/150?img=1'},
    {'username': 'jokowi', 'imageUrl': 'https://i.pravatar.cc/150?img=2'},
    {'username': 'kresna', 'imageUrl': 'https://i.pravatar.cc/150?img=3'},
    {'username': 'noel', 'imageUrl': 'https://i.pravatar.cc/150?img=4'},
  ];

  List<Map<String, dynamic>> _getPosts() => [
    {
      'username': 'bloombergtechnoz',
      'profileImage': 'https://i.pravatar.cc/150?img=4',
      'images': ['https://picsum.photos/800/800?random=1'],
      'likes': '1,143',
      'caption': 'Daftar orang terkaya Indonesia Februari 2026...',
      'timeAgo': '19 hours ago',
    },
    {
      'username': 'natgeo',
      'profileImage': 'https://i.pravatar.cc/150?img=10',
      'images': [
        'https://picsum.photos/800/1000?random=2',
        'https://picsum.photos/800/1000?random=3',
        'https://picsum.photos/800/1000?random=4',
      ],
      'likes': '45,201',
      'caption': 'Exploring the depths of the ocean.',
      'timeAgo': '2 hours ago',
    },
    {
      'username': 'eko.ariawan',
      'profileImage': 'https://i.pravatar.cc/150?img=2',
      'images': ['https://picsum.photos/800/800?random=5'],
      'likes': '89',
      'caption': 'Coding late night with Flutter 💙',
      'timeAgo': '5 hours ago',
    },
    {
      'username': 'travel_addict',
      'profileImage': 'https://i.pravatar.cc/150?img=12',
      'images': [
        'https://picsum.photos/800/600?random=6',
        'https://picsum.photos/800/600?random=7',
      ],
      'likes': '2,300',
      'caption': 'Missing Japan 🇯🇵',
      'timeAgo': '1 day ago',
    },
    {
      'username': 'tech_daily',
      'profileImage': 'https://i.pravatar.cc/150?img=15',
      'images': ['https://picsum.photos/800/800?random=8'],
      'likes': '560',
      'caption': 'New AI tools released today!',
      'timeAgo': '2 days ago',
    },
  ];
}

// --- Post Item Widget ---
class PostItem extends StatefulWidget {
  final Map<String, dynamic> post;
  const PostItem({super.key, required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.post['images'];
    final bool isCarousel = images.length > 1;

    // Font Size Variables (Diperbesar dari sebelumnya)
    const double fontUsername = 15.0;
    const double fontCaption = 15.0;
    const double fontLikes = 15.0;
    const double fontTime = 13.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18, // Avatar post header sedikit diperbesar
                backgroundImage: NetworkImage(widget.post['profileImage']),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.post['username'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontUsername, // Font Diperbesar
                  ),
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.white, size: 24),
            ],
          ),
        ),

        // 2. Image / Carousel
        GestureDetector(
          onDoubleTap: () {},
          child: AspectRatio(
            aspectRatio: 1,
            child: isCarousel
                ? PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() => _currentImageIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(images[index], fit: BoxFit.cover);
                    },
                  )
                : Image.network(images[0], fit: BoxFit.cover),
          ),
        ),

        // 3. Action Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 28,
              ), // Icon diperbesar
              const SizedBox(width: 18),
              const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 18),
              const Icon(Icons.send, color: Colors.white, size: 28),

              if (isCarousel) ...[
                const Spacer(),
                Row(
                  children: List.generate(
                    images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 7, // Dot size diperbesar
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageIndex == index
                            ? const Color(0xFF0095F6)
                            : Colors.grey[800],
                      ),
                    ),
                  ),
                ),
              ],

              const Spacer(),
              const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
            ],
          ),
        ),

        // 4. Content Text (Font Diperbesar Semua)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.post['likes']} likes',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontLikes,
                ),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: fontCaption,
                  ),
                  children: [
                    TextSpan(
                      text: widget.post['username'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' ${widget.post['caption']}'),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'View all comments',
                style: TextStyle(color: Colors.white54, fontSize: fontCaption),
              ),
              const SizedBox(height: 4),
              Text(
                widget.post['timeAgo'],
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: fontTime,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
