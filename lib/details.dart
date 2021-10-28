import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsApp extends StatelessWidget {
  final String url;

  DetailsApp({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsPage(url: url);
  }
}

class DetailsPage extends StatefulWidget {
  final String url;

  DetailsPage({Key? key,required this.url}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Book Details"),
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        body: Stack(
          children: [
            WebView(
              initialUrl: widget.url.split('\\')[0],
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading? Center(
              child: CircularProgressIndicator(),
            ): Stack(),
          ],
        ),

    );
  }
}


