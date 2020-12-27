import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _url ="https://owlbot.info/api/v4/dictionary/";
  String _token ="e9ec0e35c27e3c744e02a9e620a6d016414f850b";

  TextEditingController _controller=TextEditingController();

  StreamController _streamController;
  Stream _stream;

  Timer _debounce;



  _search() async {

    if (_controller.text == null || _controller.text.length == 0 ) {
      _streamController.add(null);
      return;
    }
    _streamController.add("waiting");
    Response response = await get(_url + _controller.text.trim(), headers: {"Authorization": "Token " + _token});
    _streamController.add(json.decode(response.body));

    if (json.decode(response.body).contains('[{"message":"No definition :("}]')) {
      _streamController.add("NoData");
      return;
    } else {
      _streamController.add(json.decode(response.body));
      return;
    }

  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF026A4F),
        title: Text('Dictionary'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0 ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    onChanged: (String text) {
                      //사용자가 1초동안 타자를 머추면 자동 검
                      if (_debounce ?. isActive ?? false) _debounce.cancel();
                      _debounce =Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
              )
            ],
          )
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if(snapshot.data ==null) {
              return Center(
                child: Text("Enter a word"),
              );
            }

            if(snapshot.data == "waiting") {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == 'NoData') {
              return Center(
                child: Text("No Definition"),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data["definitions"].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListBody(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: snapshot.data["definitions"][index]["image_url"] == null ? null : CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data["definitions"][index]["image_url"]),
                          ),
                          title: Text(_controller.text.trim() + "(" + snapshot.data["definitions"][index]["type"] + ")" ),
                          subtitle: Text(snapshot.data["definitions"][index]["definition"]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}


