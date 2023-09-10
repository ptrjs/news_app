import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../controller/news_discover_controller.dart';

class NewsDiscoverView extends StatefulWidget {
  const NewsDiscoverView({Key? key}) : super(key: key);

  Widget build(context, NewsDiscoverController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                "News from All Around World",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[400]!,
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: const InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          hoverColor: Colors.transparent,
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.sort,
                          size: 20.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              SizedBox(
                height: 32.0,
                child: ListView.builder(
                  itemCount: controller.items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = controller.items[index];
                    bool selected = controller.selectedIndex == index;

                    return InkWell(
                      onTap: () => controller.updateIndex(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        margin: const EdgeInsets.only(right: 10.0),
                        decoration: BoxDecoration(
                          color: selected ? Colors.blue : Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            item["label"]!,
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.grey,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height),
                child: ListView.builder(
                  itemCount: controller.news.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var item = controller.news[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          item["author"].toString().length > 10
                                              ? "${item["author"].toString().substring(0, 10)}..."
                                              : item["author"].toString(),
                                          style: const TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                            overflow: TextOverflow.ellipsis,
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
                                          item["publishedAt"] ?? "Unknown",
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                              overflow: TextOverflow.ellipsis),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<NewsDiscoverView> createState() => NewsDiscoverController();
}
