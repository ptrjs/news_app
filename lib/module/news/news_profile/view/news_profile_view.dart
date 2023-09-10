
import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../controller/news_profile_controller.dart';

class NewsProfileView extends StatefulWidget {
    const NewsProfileView({Key? key}) : super(key: key);

    Widget build(context, NewsProfileController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
        title: const Text("NewsProfile"),
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
    State<NewsProfileView> createState() => NewsProfileController();
}
    