import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:news_app/core.dart';
import '../controller/news_dashboard_controller.dart';

class NewsDashboardView extends StatefulWidget {
  const NewsDashboardView({Key? key}) : super(key: key);

  Widget build(context, NewsDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Badge(
                    child: Icon(Icons.notifications_none_outlined),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Breaking News",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Builder(builder: (context) {
                    List images = [];
                    List names = [];
                    List titles = [];
                    if (controller.news.isNotEmpty) {
                      images = controller.news
                          .map((item) => item["urlToImage"])
                          .toList();
                      images = images.sublist(0, 5);
                      names = controller.news
                          .map((item) => item["source"]["name"])
                          .toList();
                      names = names.sublist(0, 5);
                      titles =
                          controller.news.map((item) => item["title"]).toList();
                      titles = titles.sublist(0, 5);
                    }
                    return Column(
                      children: [
                        CarouselSlider(
                          carouselController: controller.carouselController,
                          options: CarouselOptions(
                            height: 180.0,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) {
                              controller.currentIndex = index;
                              controller.setState(() {});
                            },
                          ),
                          items: images.asMap().entries.map((entry) {
                            int index = entry.key;
                            String imageUrl = entry.value ??
                                "https://images.unsplash.com/photo-1579818277076-1abc45c9471f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2UlMjB1bmRlZmluZWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60";
                            String name = names[index] ?? "Unknown";
                            String title = titles[index] ?? "Unknown";
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            imageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              18, 12, 0, 0),
                                          child: Container(
                                            height: 30.0,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  12.0,
                                                ),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Business",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      18, 0, 0, 12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    name,
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Text(
                                                    title,
                                                    style: const TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            bool isSelected =
                                controller.currentIndex == entry.key;
                            return GestureDetector(
                              onTap: () => controller.carouselController
                                  .animateToPage(entry.key),
                              child: Container(
                                width: isSelected ? 20 : 6.0,
                                height: 6.0,
                                margin: const EdgeInsets.only(
                                  right: 6.0,
                                  top: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.grey[400],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        "Recommendation",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.5),
                    child: ListView.builder(
                      itemCount: controller.news.length,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var item = controller.news[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewsDetailView(item: item)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            item["urlToImage"] ??
                                                "https://images.unsplash.com/photo-1579818277076-1abc45c9471f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2UlMjB1bmRlZmluZWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            12.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Business",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            item["title"],
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                item["author"]
                                                            .toString()
                                                            .length >
                                                        10
                                                    ? "${item["author"].toString().substring(0, 10)}..."
                                                    : item["author"].toString(),
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              const Icon(
                                                Icons.circle,
                                                color: Colors.grey,
                                                size: 8,
                                              ),
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Text(
                                                item["publishedAt"] ??
                                                    "Unknown",
                                                style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsDashboardView> createState() => NewsDashboardController();
}
