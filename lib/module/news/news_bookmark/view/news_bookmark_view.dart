
import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../controller/news_bookmark_controller.dart';

class NewsBookmarkView extends StatefulWidget {
    const NewsBookmarkView({Key? key}) : super(key: key);

    Widget build(context, NewsBookmarkController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
        title: const Text("NewsBookmark"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: const Column(
            children: [],
            ),
        ),
        ),
    );
    }

    @override
    State<NewsBookmarkView> createState() => NewsBookmarkController();
}
    