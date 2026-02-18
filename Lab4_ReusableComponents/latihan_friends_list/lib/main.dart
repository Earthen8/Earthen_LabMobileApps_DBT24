import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Friends List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Models
class Message {
  final String text;
  final bool isMe;
  final String time;

  Message({required this.text, required this.isMe, required this.time});
}

class User {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final List<Message> chatHistory;

  User({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    required this.isOnline,
    required this.chatHistory,
  });
}

// Data source
final List<User> dummyUsers = [
  User(
    name: "Hajeera",
    avatarUrl: "https://i.pravatar.cc/150?u=Hajeera",
    lastMessage: "Ok, let me check",
    time: "9:40am",
    isOnline: true,
    chatHistory: [
      Message(text: "Hi, Hajeera.", isMe: true, time: "9:30am"),
      Message(
        text: "Are you available for a UI work?",
        isMe: true,
        time: "9:31am",
      ),
      Message(
        text: "Hey, I'm open for work, plz share details.",
        isMe: false,
        time: "9:35am",
      ),
      Message(text: "Sure I'll share you.", isMe: true, time: "9:36am"),
      Message(text: "www.dribbble.com/fbdjb/df", isMe: true, time: "9:36am"),
      Message(text: "Ok, let me check.", isMe: false, time: "9:40am"),
    ],
  ),
  User(
    name: "Riya",
    avatarUrl: "https://i.pravatar.cc/150?u=Riya",
    lastMessage: "See you tomorrow",
    time: "Yesterday",
    isOnline: false,
    chatHistory: [
      Message(text: "Don't forget the meeting.", isMe: true, time: "10:00am"),
      Message(text: "See you tomorrow", isMe: false, time: "10:05am"),
    ],
  ),
  User(
    name: "Nakul",
    avatarUrl: "https://i.pravatar.cc/150?u=Nakul",
    lastMessage: "Ok",
    time: "Monday",
    isOnline: true,
    chatHistory: [
      Message(text: "Project updated?", isMe: true, time: "9:00am"),
      Message(text: "Ok", isMe: false, time: "9:10am"),
    ],
  ),
  User(
    name: "Khan",
    avatarUrl: "https://i.pravatar.cc/150?u=Khan",
    lastMessage: "Check the documents",
    time: "Monday",
    isOnline: false,
    chatHistory: [
      Message(text: "Check the documents", isMe: false, time: "1:00pm"),
    ],
  ),
];

// Reusable components
class ContactCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const ContactCard({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                    if (user.isOnline)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Text(
                  user.time,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFFA055F5) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          message.text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}

// Screens
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 24,
              right: 24,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFB066F6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Good Morning!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.2),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: dummyUsers.length,
              itemBuilder: (context, index) {
                final user = dummyUsers[index];
                return ContactCard(
                  user: user,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ChatScreen(user: user)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final User user;

  const ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  user.isOnline ? "Active now" : "Offline",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: user.chatHistory.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: user.chatHistory[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      "Type a message...",
                      style: TextStyle(color: Colors.grey),
                    ),
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
