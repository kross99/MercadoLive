import 'package:flutter/material.dart';
import 'live_screen.dart'; // Asegúrate de importar la pantalla de Live

class FeedScreen extends StatelessWidget {

  final List<Map<String, dynamic>> videoPosts = [
    {
      'user': 'user_1',
      'description': '¡Mi primer video! #hola #flutter',
      'likes': 123,
      'comments': 45,
      'shares': 67,
      'videoColor': Colors.redAccent
    },
    {
      'user': 'gamer_dev',
      'description': 'Jugando el nuevo juego de Flutter #gaming #flutter',
      'likes': 1023,
      'comments': 255,
      'shares': 301,
      'videoColor': Colors.blueAccent
    },
    {
      'user': 'cocina_facil',
      'description': 'Receta de pastel de chocolate en 1 minuto #receta #cocina',
      'likes': 5402,
      'comments': 890,
      'shares': 1204,
      'videoColor': Colors.greenAccent
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoPosts.length,
            itemBuilder: (context, index) {
              final post = videoPosts[index];
              return VideoPost(post: post);
            },
          ),
          Positioned(
            top: 40, // Un poco de espacio desde la parte superior
            right: 20,
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LiveScreen()),
                );
              },
              icon: Icon(Icons.live_tv, color: Colors.white),
              label: Text('En Vivo', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPost extends StatelessWidget {
  final Map<String, dynamic> post;

  const VideoPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: post['videoColor'] as Color? ?? Colors.black,
      child: Stack(
        children: [
          // Aquí iría el reproductor de video
          Center(
            child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 100, // Espacio para los botones de acción
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${post["user"]}',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  post["description"],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                IconButton(icon: Icon(Icons.favorite, color: Colors.white), onPressed: () {}),
                Text(post["likes"].toString(), style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                IconButton(icon: Icon(Icons.comment, color: Colors.white), onPressed: () {}),
                Text(post["comments"].toString(), style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                IconButton(icon: Icon(Icons.share, color: Colors.white), onPressed: () {}),
                Text(post["shares"].toString(), style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
