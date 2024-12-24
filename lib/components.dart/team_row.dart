import 'package:flutter/material.dart';

class TeamRow extends StatelessWidget {
  final int rank;
  final String name;
  final int game1;
  final int game2;
  final int game3;
  final int game4;
  final int total;

  const TeamRow({
    Key? key,
    required this.rank,
    required this.name,
    required this.game1,
    required this.game2,
    required this.game3,
    required this.game4,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.orangeAccent, width: 1.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Rank
          Text(
            '$rank',
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(width: 10.0),

          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis, // for long names
            ),
          ),

          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$game1', style: const TextStyle(color: Colors.white)),
                Text('$game2', style: const TextStyle(color: Colors.white)),
                Text('$game3', style: const TextStyle(color: Colors.white)),
                Text('$game4', style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),

          Text(
            '$total',
            style: const TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
