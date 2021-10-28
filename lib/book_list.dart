import 'api_manager.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class BookListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBookListRoute();
  }
}

class MyBookListRoute extends StatefulWidget {
  const MyBookListRoute({Key? key}) : super(key: key);

  @override
  _MyBookListRouteState createState() => _MyBookListRouteState();
}

class _MyBookListRouteState extends State<MyBookListRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book List"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Container(
        child: FutureBuilder(
          future: ApiManager.getBookList(),
          builder: (BuildContext ctx,AsyncSnapshot snapshot) {
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(12),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (ctx,index) => GestureDetector(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ), // title
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              IconTheme(
                                data: IconThemeData(color: Colors.black54),
                                child: Icon(
                                  Icons.account_box_rounded,
                                  size: 14,
                                )
                              ),
                              Text(
                                snapshot.data[index].author,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),

                              ),
                            ],// author
                          ), // author
                          SizedBox(height: 20,), // gap
                          Row(
                            children: [
                              IconTheme(
                                  data: IconThemeData(color: Colors.black54),
                                  child: Icon(
                                    Icons.language,
                                    size: 14,
                                  )
                              ),
                              Text(
                                "${snapshot.data[index].language}  ·  ",
                              ),
                              IconTheme(
                                  data: IconThemeData(color: Colors.black54),
                                  child: Icon(
                                    Icons.find_in_page_outlined,
                                    size: 14,
                                  )
                              ),// lang
                              Text(
                                "${snapshot.data[index].pages} pages  ·  ",
                              ), // pages
                              IconTheme(
                                  data: IconThemeData(color: Colors.black54),
                                  child: Icon(
                                    Icons.timer,
                                    size: 14,
                                  )
                              ),// lang
                              Text(
                                "${snapshot.data[index].year} CE",
                              ), // year
                            ],
                          )
                        ],
                      ),
                    ),
                  onTap: () => Navigator.push(
                                  context, MaterialPageRoute(
                                      builder: (context) => DetailsApp(
                                          url: snapshot.data[index].link
                                      )
                                  ),
                                ),
                )
              );
            }
          },
        ),
      ),
    );
  }
}
