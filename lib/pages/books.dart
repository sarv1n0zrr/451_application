import 'package:book_app/components.dart/book_card.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This Month's Book",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/atomic_habits.jpg',
                  height: 200,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Atomic Habits",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'James Clear',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressIndicator(
                            value: 0.6, // 60% progres
                            color: Colors.orange,
                            backgroundColor: Colors.grey[300],
                          ),
                          SizedBox(height: 4),
                          Text(
                            "241 / 346 pages",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // PDF
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Get PDF",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Notes / Bookmarks",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Previous Books",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                BookCard(
                  bookName: 'The Alchemist',
                  authorName: 'Paulo Coelho',
                  imagePath: 'assets/alchemist.jpg',
                  rating: '4.7',
                ),
                SizedBox(
                  width: 5,
                ),
                BookCard(
                  bookName: 'Shoko Alem 1/2',
                  authorName: 'Сауытбай Р',
                  imagePath: 'assets/shoko_alem_2.jpg',
                  rating: '4.0',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                BookCard(
                  bookName: 'Shkolota',
                  authorName: 'Ақиқат Рас',
                  imagePath: 'assets/shkolota.jpg',
                  rating: '4.2',
                ),
                SizedBox(
                  width: 5,
                ),
                BookCard(
                  bookName: 'Жизнь обалденна',
                  authorName: 'Ақиқат Рас',
                  imagePath: 'assets/shizn_obaldenna.png',
                  rating: '4.8',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                BookCard(
                  bookName: '10 негритят',
                  authorName: 'Агата Кристи',
                  imagePath: 'assets/10_negritat.jpg',
                  rating: '4.6',
                ),
                SizedBox(
                  width: 5,
                ),
                BookCard(
                  bookName: 'Ұшқан ұя',
                  authorName: 'Бауыржан Момышұлы',
                  imagePath: 'assets/ushkan_yua.jpg',
                  rating: '4.8',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
