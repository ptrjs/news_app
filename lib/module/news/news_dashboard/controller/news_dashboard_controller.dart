import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import 'package:news_app/services/news_service/news_service.dart';
import '../view/news_dashboard_view.dart';

class NewsDashboardController extends State<NewsDashboardView> {
  static late NewsDashboardController instance;
  late NewsDashboardView view;

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

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

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
