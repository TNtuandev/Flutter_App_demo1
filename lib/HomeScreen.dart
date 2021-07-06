import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:test3/model/itemModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:zoom_widget/zoom_widget.dart';
class HomeScreen extends StatefulWidget {
  int index=0;
  HomeScreen(this.index);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('CSS tutorial'),
        actions: [
          IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                setState(() {
                  if (widget.index != 0) widget.index--;
                  _loadHtmlFromAssets();
                });
              }),
          IconButton(
              icon: const Icon(Icons.navigate_next, size: 40),
              onPressed: () {
                setState(() {
                  widget.index++;
                  if (widget.index == listData.length) widget.index = 0;
                  _loadHtmlFromAssets();
                });
              }),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.symmetric( horizontal: 10),
                    child: WebView(
                      initialUrl: '',
                      onWebViewCreated: (WebViewController webViewController) async{
                        _controller = webViewController;
                        _loadHtmlFromAssets();
                      },
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  );

                }),

          ),

        ],
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('${listData[widget.index].name}');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
