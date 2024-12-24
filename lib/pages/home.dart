import 'package:book_app/auth/auth_service.dart';
import 'package:book_app/components.dart/my_textfield.dart';
import 'package:book_app/components.dart/post.dart';
import 'package:book_app/helper/helper_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: provider.logout,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: provider.postsStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final post = snapshot.data!.docs[index];
                              return Post(
                                message: post['Message'] ?? 'No message',
                                user: post['UserEmail'] ?? 'Unknown user',
                                postId: post.id,
                                time: formatDate(post["TimeStamp"]),
                                likes: List<String>.from(post['Likes'] ?? []),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Logged in as: ${provider.currentUserEmail}",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 25, left: 25, right: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: MyTextField(
                            controller: provider.textController,
                            hintText: 'Write something on the wall',
                            obscureText: false,
                          ),
                        ),
                        IconButton(
                          onPressed: provider.postMessage,
                          icon: const Icon(
                            Icons.arrow_circle_up,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController textController = TextEditingController();

  User? get currentUser => _auth.currentUser;

  String get currentUserEmail => currentUser?.email ?? "Unknown";

  Stream<QuerySnapshot> get postsStream => _firestore
      .collection("User Posts")
      .orderBy('TimeStamp', descending: false)
      .snapshots();

  void logout() async {
    final authService = AuthService();
    await authService.signOut();
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      _firestore.collection("User Posts").add({
        'UserEmail': currentUserEmail,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
      textController.clear();
      notifyListeners();
    }
  }
}
