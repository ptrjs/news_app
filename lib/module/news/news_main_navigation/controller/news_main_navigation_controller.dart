import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../view/news_main_navigation_view.dart';

class NewsMainNavigationController extends State<NewsMainNavigationView> {
  static late NewsMainNavigationController instance;
  late NewsMainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }
}
