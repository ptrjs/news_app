
import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../view/news_bookmark_view.dart';

class NewsBookmarkController extends State<NewsBookmarkView> {
    static late NewsBookmarkController instance;
    late NewsBookmarkView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    