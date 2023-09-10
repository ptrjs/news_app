
import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../view/news_profile_view.dart';

class NewsProfileController extends State<NewsProfileView> {
    static late NewsProfileController instance;
    late NewsProfileView view;

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
        
    