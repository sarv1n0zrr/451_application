import 'package:cloud_firestore/cloud_firestore.dart';

class TeamUploader {
  Future<void> uploadTeams() async {
    final teams = [
      [
        "ЛидерС",
        16,
        20,
        17,
        0,
        53,
        ["Naruto", "Sasuke", "Sakura"]
      ],
      [
        "ЭЖЕ",
        17,
        17,
        18,
        0,
        52,
        ["Goku", "Vegeta", "Gohan"]
      ],
      [
        "Next Leaders",
        18,
        16,
        14,
        0,
        48,
        ["Luffy", "Zoro", "Nami"]
      ],
      [
        "SDC",
        13,
        15,
        17,
        0,
        45,
        ["Edward", "Alphonse", "Winry"]
      ],
      [
        "BookWorms",
        15,
        14,
        16,
        0,
        45,
        ["Light", "L", "Misa"]
      ],
      [
        "Beasts",
        16,
        14,
        15,
        0,
        45,
        ["Eren", "Mikasa", "Armin"]
      ],
      [
        "Fire",
        17,
        16,
        10,
        0,
        43,
        ["Itachi", "Kakashi", "Shikamaru"]
      ],
      [
        "Sakura",
        15,
        16,
        11,
        0,
        42,
        ["Ichigo", "Rukia", "Orihime"]
      ],
      [
        "mean girls",
        10,
        15,
        16,
        0,
        41,
        ["Usagi", "Rei", "Makoto"]
      ],
      [
        "KMA",
        10,
        10,
        13,
        0,
        33,
        ["Natsu", "Lucy", "Gray"]
      ],
      [
        "Братишки маги",
        16,
        11,
        6,
        0,
        33,
        ["Gon", "Killua", "Kurapika"]
      ],
      [
        "SpirIT",
        4,
        13,
        9,
        0,
        26,
        ["Saitama", "Genos", "Bang"]
      ],
      [
        "HeMeHe",
        17,
        0,
        0,
        0,
        17,
        ["Asta", "Yuno", "Noelle"]
      ],
      [
        "BTX",
        4,
        8,
        4,
        0,
        16,
        ["Kaneki", "Touka", "Hide"]
      ],
      [
        "Hackbooks",
        13,
        0,
        3,
        0,
        16,
        ["Levi", "Hange", "Erwin"]
      ],
      [
        "Formidable",
        2,
        12,
        0,
        0,
        14,
        ["Gintoki", "Kagura", "Shinpachi"]
      ],
      [
        "аты жок",
        4,
        10,
        0,
        0,
        14,
        ["Akame", "Tatsumi", "Esdeath"]
      ],
      [
        "Енд не стеймиз",
        14,
        0,
        0,
        0,
        14,
        ["Rimuru", "Shuna", "Benimaru"]
      ],
      [
        "GOF",
        3,
        9,
        0,
        0,
        12,
        ["Tanjiro", "Nezuko", "Zenitsu"]
      ],
      [
        "Story seekers",
        5,
        6,
        0,
        0,
        11,
        ["Yato", "Hiyori", "Yukine"]
      ],
      [
        "Wisetriad",
        9,
        0,
        0,
        0,
        9,
        ["Lelouch", "Suzaku", "C.C."]
      ],
      [
        "Trinity Infinity",
        8,
        0,
        0,
        0,
        8,
        ["Spike", "Jet", "Faye"]
      ],
    ];

    final teamsCollection = FirebaseFirestore.instance.collection('teams');

    for (final team in teams) {
      try {
        await teamsCollection.add({
          'name': team[0],
          'game1': team[1],
          'game2': team[2],
          'game3': team[3],
          'game4': team[4],
          'total': team[5],
          'members': team[6],
        });
        print('Uploaded team: ${team[1]}');
      } catch (e) {
        print('Error uploading team ${team[1]}: $e');
      }
    }
  }
}
