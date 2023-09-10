import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../../../../services/news_service/news_service.dart';
import '../view/news_discover_view.dart';

class NewsDiscoverController extends State<NewsDiscoverView> {
  static late NewsDiscoverController instance;
  late NewsDiscoverView view;

  @override
  void initState() {
    instance = this;
    getNews();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  var items = [
    {
      "label": "All",
      "value": "All",
    },
    {
      "label": "Politics",
      "value": "Politics",
    },
    {
      "label": "Business",
      "value": "Business",
    },
    {
      "label": "Technology",
      "value": "Technology",
    },
    {
      "label": "Sport",
      "value": "Sport",
    },
  ];

  List news = [];
  getNews() async {
    try {
      news = await NewsService().get();
      print(news);
      setState(() {});
    } on Exception catch (err) {
      print(err);
    }
  }
}
