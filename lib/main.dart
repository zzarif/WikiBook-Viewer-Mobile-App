import 'package:flutter/material.dart';
import 'package:libray_app/book_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library App',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library App"),
        leading: Icon(Icons.library_books_rounded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Library App",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Righteous',
                  ),
                ),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconTheme(
                        data: IconThemeData(color: Colors.black87),
                        child: Icon(
                          Icons.next_week_rounded,
                          size: 16,
                        )),
                    Text(
                      " Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookListApp()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
