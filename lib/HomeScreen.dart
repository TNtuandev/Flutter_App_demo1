import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:test3/model/itemModel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';
import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  int index = 0;
  HomeScreen(this.index);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // WebViewController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fluttertoast.showToast(
        msg: "Có thể sử dụng 2 ngón để phóng to bài viết",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,


    );
  }

  WebViewPlusController _controller;
  InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSS tutorial'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                  android: AndroidInAppWebViewOptions(
                useHybridComposition: true,
                defaultFontSize: 35,
              )),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
                webView.loadFile(assetFilePath: listData[widget.index].name);
              },
            ),
          )),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    if (widget.index != 0) widget.index--;
                    webView.loadFile(
                        assetFilePath: listData[widget.index].name);
                  });
                },
              ),
              ElevatedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    widget.index++;
                    if (widget.index == listData.length) widget.index = 0;
                    webView.loadFile(
                        assetFilePath: listData[widget.index].name);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
