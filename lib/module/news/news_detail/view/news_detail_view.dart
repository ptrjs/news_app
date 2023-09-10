import 'package:flutter/material.dart';
import 'package:news_app/core.dart';
import '../controller/news_detail_controller.dart';

class NewsDetailView extends StatefulWidget {
  final Map item;
  const NewsDetailView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, NewsDetailController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NewsMainNavigationView()),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item["urlToImage"] ??
                            "https://images.unsplash.com/photo-1579818277076-1abc45c9471f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW1hZ2UlMjB1bmRlZmluZWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 200, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        item["title"] ?? "Unknown",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        item["publishedAt"],
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            item["author"] ?? "Unknown",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        item["content"] ?? "Unknown",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
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
  }

  @override
  State<NewsDetailView> createState() => NewsDetailController();
}
