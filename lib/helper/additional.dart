// import 'package:flutter/material.dart';

// class RatingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // Set background color to black
//       appBar: AppBar(
//         title: const Text(
//           "Rating",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildTableHeader(),
//               _buildTableRows(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTableHeader() {
//     return Container(
//       color: Colors.grey[900], // Dark header background
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//       child: const Row(
//         children: const [
//           _HeaderCell("#", flex: 1),
//           _HeaderCell("Team", flex: 3),
//           _HeaderCell("G1", flex: 1),
//           _HeaderCell("G2", flex: 1),
//           _HeaderCell("G3", flex: 1),
//           _HeaderCell("G4", flex: 1),
//           _HeaderCell("Total", flex: 2),
//         ],
//       ),
//     );
//   }

//   Widget _buildTableRows() {
//     final data = [
      // ["1", "ЛидерС", "16", "20", "17", "0", "53"],
      // ["2", "ЭЖЕ", "17", "17", "18", "0", "52"],
      // ["3", "Next Leaders", "18", "16", "14", "0", "48"],
      // ["4", "SDC", "13", "15", "17", "0", "45"],
      // ["5", "BookWorms", "15", "14", "16", "0", "45"],
      // ["6", "Beasts", "16", "14", "15", "0", "45"],
      // ["7", "Fire", "17", "16", "10", "0", "43"],
      // ["8", "Sakura", "15", "16", "11", "0", "42"],
      // ["9", "mean girls", "10", "15", "16", "0", "41"],
      // ["10", "KMA", "10", "10", "13", "0", "33"],
      // ["11", "Братишки маги", "16", "11", "6", "0", "33"],
      // ["12", "SpirIT", "4", "13", "9", "0", "26"],
      // ["13", "HeMeHe", "17", "0", "0", "0", "17"],
      // ["14", "BTX", "4", "8", "4", "0", "16"],
      // ["15", "Hackbooks", "13", "0", "3", "0", "16"],
      // ["16", "Formidable", "2", "12", "0", "0", "14"],
      // ["17", "аты жок", "4", "10", "0", "0", "14"],
      // ["18", "Енд не стеймиз", "14", "0", "0", "0", "14"],
      // ["19", "GOF", "3", "9", "0", "0", "12"],
      // ["20", "Story seekers", "5", "6", "0", "0", "11"],
      // ["21", "Wisetriad", "9", "0", "0", "0", "9"],
      // ["22", "Trinity Infinity", "8", "0", "0", "0", "8"],
//     ];

//     return Column(
//       children: data.map((row) => _buildRow(row)).toList(),
//     );
//   }

//   Widget _buildRow(List<String> row) {
//     return Container(
//       color: Colors.grey[850],
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
//       margin: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         children: [
//           _DataCell(row[0], flex: 1),
//           _DataCell(row[1], flex: 3),
//           _DataCell(row[2], flex: 1),
//           _DataCell(row[3], flex: 1),
//           _DataCell(row[4], flex: 1),
//           _DataCell(row[5], flex: 1),
//           _DataCell(
//             row[6],
//             flex: 2,
//             color: Colors.orange,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _HeaderCell extends StatelessWidget {
//   final String text;
//   final int flex;

//   const _HeaderCell(this.text, {required this.flex});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white70,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// class _DataCell extends StatelessWidget {
//   final String text;
//   final int flex;
//   final Color? color;

//   const _DataCell(this.text, {required this.flex, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 5.0),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: color ?? Colors.white,
//             fontSize: 14.0,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }













// HOME PAGE
// import 'package:book_app/auth/auth_service.dart';
// import 'package:book_app/components.dart/my_textfield.dart';
// import 'package:book_app/components.dart/post.dart';
// import 'package:book_app/helper/helper_methods.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final currentUser = FirebaseAuth.instance.currentUser!;
//   final textController = TextEditingController();
//   void logout() {
//     final _auth = AuthService();
//     _auth.signOut();
//   }

//   void postMessage() {
//     // only post if there any data in the textfield
//     if (textController.text.isNotEmpty) {
//       FirebaseFirestore.instance.collection("User Posts").add({
//         'UserEmail': currentUser.email,
//         'Message': textController.text,
//         'TimeStamp': Timestamp.now(),
//         'Likes': [],
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Home',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: logout,
//             icon: const Icon(
//               Icons.logout,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("User Posts")
//                     .orderBy(
//                       'TimeStamp',
//                       descending: false,
//                     )
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         final post = snapshot.data!.docs[index];
//                         return Post(
//                           message: post['Message'] ?? 'No message',
//                           user: post['UserEmail'] ?? 'Unknown user',
//                           postId: post.id,
//                           time: formatDate(post["TimeStamp"]),
//                           likes: List<String>.from(post['Likes'] ?? []),
//                         );
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Center(
//                       child: Text('Error:${snapshot.error}'),
//                     );
//                   }
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               "Logged in as: " + currentUser.email!,
//               style: TextStyle(
//                 color: Colors.grey[400],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MyTextField(
//                       controller: textController,
//                       hintText: 'Write something on the wall',
//                       obscureText: false,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: postMessage,
//                     icon: Icon(
//                       Icons.arrow_circle_up,
//                       color: Colors.orange,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// quiz/question
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AddPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TestCreationProvider(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Create a Test',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           backgroundColor: Colors.black,
//         ),
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Consumer<TestCreationProvider>(
//             builder: (context, provider, _) {
//               return Form(
//                 key: provider.formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: provider.testNameController,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         labelText: 'Test Name',
//                         labelStyle: TextStyle(color: Colors.white70),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white54),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a test name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: provider.questions.length,
//                         itemBuilder: (context, index) {
//                           final question = provider.questions[index];
//                           return Card(
//                             color: Colors.grey[850],
//                             margin: EdgeInsets.only(bottom: 10),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   TextFormField(
//                                     initialValue: question['question'],
//                                     style: TextStyle(color: Colors.white),
//                                     decoration: InputDecoration(
//                                       labelText: 'Question ${index + 1}',
//                                       labelStyle:
//                                           TextStyle(color: Colors.white70),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white54),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white),
//                                       ),
//                                     ),
//                                     onChanged: (value) {
//                                       provider.updateQuestion(index, value);
//                                     },
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter a question';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   ...List.generate(4, (optionIndex) {
//                                     return Row(
//                                       children: [
//                                         Radio<int>(
//                                           value: optionIndex,
//                                           groupValue: question['correctOption'],
//                                           onChanged: (value) {
//                                             provider.updateCorrectOption(
//                                                 index, value!);
//                                           },
//                                           fillColor:
//                                               MaterialStateProperty.resolveWith(
//                                                   (states) => Colors.white),
//                                         ),
//                                         Expanded(
//                                           child: TextFormField(
//                                             initialValue: question['options']
//                                                 [optionIndex],
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                             decoration: InputDecoration(
//                                               labelText:
//                                                   'Option ${optionIndex + 1}',
//                                               labelStyle: TextStyle(
//                                                   color: Colors.white70),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white54),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                             onChanged: (value) {
//                                               provider.updateOption(
//                                                   index, optionIndex, value);
//                                             },
//                                             validator: (value) {
//                                               if (value == null ||
//                                                   value.isEmpty) {
//                                                 return 'Please enter option ${optionIndex + 1}';
//                                               }
//                                               return null;
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   }),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         ElevatedButton(
//                           onPressed: provider.addQuestion,
//                           child: Text('Add Question'),
//                         ),
//                         ElevatedButton(
//                           onPressed: provider.submitTest,
//                           child: Text('Submit Test'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TestCreationProvider extends ChangeNotifier {
//   final formKey = GlobalKey<FormState>();
//   final testNameController = TextEditingController();
//   List<Map<String, dynamic>> questions = [];

//   void addQuestion() {
//     questions.add({
//       'question': '',
//       'options': List<String>.generate(4, (index) => ''),
//       'correctOption': 0,
//     });
//     notifyListeners();
//   }

//   void updateQuestion(int index, String value) {
//     questions[index]['question'] = value;
//     notifyListeners();
//   }

//   void updateOption(int questionIndex, int optionIndex, String value) {
//     questions[questionIndex]['options'][optionIndex] = value;
//     notifyListeners();
//   }

//   void updateCorrectOption(int questionIndex, int value) {
//     questions[questionIndex]['correctOption'] = value;
//     notifyListeners();
//   }

//   void submitTest() {
//     if (formKey.currentState!.validate()) {
//       final testData = {
//         'testName': testNameController.text,
//         'questions': questions,
//       };
//       print('Test Data: $testData');
//       testNameController.clear();
//       questions.clear();
//       notifyListeners();
//     }
//   }
// }
