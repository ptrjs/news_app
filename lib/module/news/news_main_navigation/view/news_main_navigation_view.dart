import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/core.dart';

class NewsMainNavigationView extends StatefulWidget {
  const NewsMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, NewsMainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            NewsDashboardView(),
            NewsDiscoverView(),
            NewsBookmarkView(),
            NewsProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.web,
              ),
              label: "Discover",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_outlined,
              ),
              label: "Bookmark",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsMainNavigationView> createState() => NewsMainNavigationController();
}
