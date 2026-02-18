import 'package:flutter/material.dart';

// MOCK DATA MODEL
class Book {
  final String title;
  final String author;
  final String category;
  final bool isAvailable;
  final Color coverColor;

  Book({
    required this.title,
    required this.author,
    required this.category,
    required this.isAvailable,
    required this.coverColor,
  });
}

// SAMPLE DATA
final List<Book> _allBooks = [
  Book(
    title: "Introduction to Algorithms",
    author: "Thomas H. Cormen",
    category: "Books",
    isAvailable: true,
    coverColor: const Color(0xFF5C7CFA),
  ),
  Book(
    title: "Clean Code",
    author: "Robert C. Martin",
    category: "E-Books",
    isAvailable: false,
    coverColor: const Color(0xFF3BC9DB),
  ),
  Book(
    title: "Modern Economics Journal",
    author: "University Press",
    category: "Journals",
    isAvailable: true,
    coverColor: const Color(0xFF69DB7C),
  ),
  Book(
    title: "Quantum Physics Vol. 1",
    author: "H.C. Verma",
    category: "Research",
    isAvailable: true,
    coverColor: const Color(0xFF9775FA),
  ),
  Book(
    title: "Flutter for Beginners",
    author: "Alessandro Biessek",
    category: "Books",
    isAvailable: true,
    coverColor: const Color(0xFFFF8787),
  ),
];

// MAIN PAGE WIDGET
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  String _searchQuery = "";
  String _selectedCategory = "All";
  final List<String> _categories = [
    "All",
    "Books",
    "Journals",
    "E-Books",
    "Research",
  ];

  List<Book> get _filteredBooks {
    return _allBooks.where((book) {
      final matchesSearch =
          book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          book.author.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == "All" || book.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRedHeader(context),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: "Search title, author...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // CATEGORY CHIPS
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() => _selectedCategory = category);
                      },
                      selectedColor: const Color(0xFFFFEBEE),
                      labelStyle: TextStyle(
                        color: isSelected
                            ? const Color(0xFFD32F2F)
                            : Colors.grey[700],
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFFD32F2F)
                              : Colors.grey[300]!,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // BOOK LIST
            Expanded(
              child: _filteredBooks.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: _filteredBooks.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return BookCard(book: _filteredBooks[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER FUNCTION
  Widget _buildRedHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFD32F2F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 20, 20),
          child: Row(
            children: [
              // Back Button
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to Dashboard
                },
              ),

              const SizedBox(width: 10),

              // Title "Library"
              const Text(
                "Library",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter',
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu_book_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text("No books found", style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}

// BOOK CARD COMPONENT
class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Cover Color
          Container(
            width: 90,
            decoration: BoxDecoration(
              color: book.coverColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: const Center(
              child: Icon(Icons.book, color: Colors.white54, size: 32),
            ),
          ),
          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.category.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    book.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF343A40),
                    ),
                  ),
                  Text(
                    book.author,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  const Spacer(),
                  // Availability
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: book.isAvailable
                              ? const Color(0xFF40C057)
                              : const Color(0xFFFA5252),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        book.isAvailable ? "Available" : "Checked Out",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: book.isAvailable
                              ? const Color(0xFF2B8A3E)
                              : const Color(0xFFC92A2A),
                        ),
                      ),
                    ],
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
