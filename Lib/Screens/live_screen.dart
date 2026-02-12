import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {

  final List<Map<String, dynamic>> liveStreams = [
    {
      'user': 'live_gamer_1',
      'thumbnailColor': Colors.purpleAccent,
      'viewers': 1500,
    },
    {
      'user': 'fashion_guru',
      'thumbnailColor': Colors.pinkAccent,
      'viewers': 8500,
    },
    {
      'user': 'tech_reviewer',
      'thumbnailColor': Colors.lightBlueAccent,
      'viewers': 2300,
    },
    {
      'user': 'music_lover',
      'thumbnailColor': Colors.orangeAccent,
      'viewers': 4200,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transmisiones en Vivo'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 9 / 16, // Proporción de aspecto vertical
        ),
        itemCount: liveStreams.length,
        itemBuilder: (context, index) {
          final stream = liveStreams[index];
          return LiveStreamCard(stream: stream);
        },
      ),
    );
  }
}

class LiveStreamCard extends StatelessWidget {
  final Map<String, dynamic> stream;

  const LiveStreamCard({Key? key, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            color: stream['thumbnailColor'] as Color? ?? Colors.grey,
            child: Center(
              child: Icon(Icons.play_circle_outline, color: Colors.white, size: 50),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('EN VIVO', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${stream["user"]}',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      stream["viewers"].toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
