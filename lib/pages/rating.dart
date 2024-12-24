import 'package:book_app/components.dart/game_card.dart';
import 'package:book_app/components.dart/member_card.dart';
import 'package:book_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingPage extends StatelessWidget {
  final CollectionReference teamsCollection =
      FirebaseFirestore.instance.collection('teams');

  Future<List<Team>> getRankedTeams() async {
    final snapshot = await teamsCollection.get();
    final List<Team> teamsList = [];

    for (var teamDoc in snapshot.docs) {
      teamsList.add(Team.fromJson(teamDoc.data() as Map<String, dynamic>));
    }

    teamsList.sort((a, b) => b.total.compareTo(a.total));
    return teamsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Rating',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Team>>(
        future: getRankedTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.redAccent),
              ),
            );
          }

          final teams = snapshot.data ?? [];

          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade800, width: 1),
                  ),
                ),
                child: ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  title: Text(
                    team.name,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  subtitle: Text(
                    'Total: ${team.total}',
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeamDetailsPage(team),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TeamDetailsPage extends StatelessWidget {
  const TeamDetailsPage(this.team, {super.key});
  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          team.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameCard(
                    gameName: 'Game 1',
                    month: 'September',
                    score: '${team.game1}'),
                SizedBox(
                  width: 10,
                ),
                GameCard(
                    gameName: 'Game 2',
                    month: 'October',
                    score: '${team.game2}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameCard(
                    gameName: 'Game 3',
                    month: 'November',
                    score: '${team.game3}'),
                SizedBox(
                  width: 10,
                ),
                GameCard(
                    gameName: 'Game 4',
                    month: 'December',
                    score: '${team.game4}'),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                'Total: ${team.total}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Members:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: team.members.length,
                itemBuilder: (context, index) {
                  final teamMember = team.members[index];
                  return MemberCard(memberName: '- $teamMember');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
