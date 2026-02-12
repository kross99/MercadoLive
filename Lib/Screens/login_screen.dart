import 'package:flutter/material.dart';
import 'feed_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FeedScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color darkViolet = Colors.deepPurple.shade700;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/images/mercado_logo.jpg',
                  height: 150,
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 48.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: darkViolet),
                  child: Text("Ingresar"),
                  onPressed: _login,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: darkViolet),
                      child: Text("Registrar"),
                      onPressed: () {
                        // TODO: Implementar la funcionalidad de registro
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: darkViolet),
                      child: Text("Olvidé mi contraseña"),
                      onPressed: () {
                        // TODO: Implementar la funcionalidad de olvidar contraseña
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('O inicia sesión con'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () { /* TODO: Implementar login con Google */ },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/google_logo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () { /* TODO: Implementar login con Facebook */ },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/facebook_logo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () { /* TODO: Implementar login con TikTok */ },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assets/images/tiktok_logo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
