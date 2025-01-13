import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Widget webView(String url, webController) {
  return InAppWebView(
    pullToRefreshController: PullToRefreshController(
      onRefresh: () {},
    ),
    initialUrlRequest: URLRequest(url: WebUri(url)),
    // initialOptions:
    //     InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
    onWebViewCreated: (controller) {
      webController = controller;
    },
  );
}
