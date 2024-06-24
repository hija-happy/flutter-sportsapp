import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedPage2 extends StatelessWidget {
  const NewsFeedPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _articles[index];
              final monthsAgo = _calculateMonthsAgo(item.postedOn);

              return GestureDetector(
                onTap: () async {
                  if (await canLaunch(item.url)) {
                    await launch(item.url);
                  } else {
                    throw 'Could not launch ${item.url}';
                  }
                },
                child: Container(
                  height: 136,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${item.author} · $monthsAgo months ago",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icons.bookmark_border_rounded,
                                Icons.share,
                                Icons.more_vert,
                              ].map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(e, size: 16),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (await canLaunch(item.url)) {
                            await launch(item.url);
                          } else {
                            throw 'Could not launch ${item.url}';
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  int _calculateMonthsAgo(DateTime postedOn) {
    final now = DateTime.now();
    final difference = now.difference(postedOn);
    return difference.inDays ~/ 30;
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final DateTime postedOn;
  final String url;

  Article({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.postedOn,
    required this.url,
  });
}

final List<Article> _articles = [
  Article(
    title: "Alva’s College emerges overall champions in the varsity-level inter-collegiate athletics meet",
    author: "The Hindu",
    imageUrl: "https://picsum.photos/id/1000/960/540",
    postedOn: DateTime.now().subtract(Duration(days: 180)),
    url: "https://www.thehindu.com/news/cities/Mangalore/alvas-college-emerges-overall-champions-in-the-varsity-level-inter-collegiate-athletics-meet/article67611575.ece",
  ),
  Article(
    title: "Moodbidri: Around 3500 athletes from 240 universities gather at Swaraj Maidan",
    imageUrl: "https://picsum.photos/id/1010/960/540",
    author: "Coastal Digest",
    postedOn: DateTime.now().subtract(Duration(days: 60)),
    url: "https://www.coastaldigest.com/moodbidri-around-3500-athletes-240-universities-gather-swaraj-maidan?page=5",
  ),
  Article(
    title: "Indoor Stadium inaugurated on Alva’s college campus in Moodbidri",
    imageUrl: "https://picsum.photos/id/1001/960/540",
    author: "The Hindu",
    postedOn: DateTime.now().subtract(Duration(days: 240)),
    url: "https://www.thehindu.com/news/cities/Mangalore/indoor-stadium-inaugurated-on-alvas-college-campus-in-moodbidri/article67384596.ece",
  ),
  Article(
    title: "Tokyo Olympics: 2 students from Karnataka's Alva’s college to represent India",
    imageUrl: "https://picsum.photos/id/1002/960/540",
    author: "Times of India",
    postedOn: DateTime.now().subtract(Duration(days: 910)),
    url: "https://timesofindia.indiatimes.com/city/mangaluru/tokyo-olympics-2-students-from-karnatakas-alvas-college-to-represent-india/articleshow/84412327.cms",
  ),
  Article(
    title: "'Media Buzz' state-level seminar at Alva's College, Moodbidri focuses on sports journalism",
    imageUrl: "https://picsum.photos/id/1020/960/540",
    author: "Daijiworld",
    postedOn: DateTime.now().subtract(Duration(days: 3100)),
    url: "https://www.daijiworld.com/news/newsDisplay?newsID=300084",
  ),
  Article(
    title: "Moodbidri: Alva's PU college achieves its best ever result in II-PU examination",
    imageUrl: "https://picsum.photos/id/1021/960/540",
    author: "Udayavani",
    postedOn: DateTime.now().subtract(Duration(days: 60)),
    url: "https://www.udayavani.com/english-news/moodbidri-alvas-pu-college-achieves-its-best-ever-result-in-ii-pu-examination",
  ),
  Article(
    title: "Alumna of Alva’s College to lead tri-services contingent at parade",
    imageUrl: "https://picsum.photos/id/1060/960/540",
    author: "Times of India",
    postedOn: DateTime.now().subtract(Duration(days: 180)),
    url: "https://timesofindia.indiatimes.com/city/mangaluru/alumna-of-alvas-college-to-lead-tri-services-contingent-at-parade/articleshow/107159399.cms",
  ),
];
