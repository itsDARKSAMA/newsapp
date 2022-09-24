import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class NewsArticleItem extends StatelessWidget {
  final Map article;

  const NewsArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: article['urlToImage'] != null
                    ? NetworkImage('${article['urlToImage']}')
                    : const NetworkImage('https://bit.ly/3UA6iHe'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('${article['title']}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '${article['description']}',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                  Expanded(
                    // flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${article['publishedAt']}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget defaultLoadingIndicator() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(74.0),
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        strokeWidth: 1,
      ),
    ),
  );
}

Widget articleDiveder() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      color: Colors.grey[300],
      height: 0.5,
    ),
  );
}

Widget articleBuilder(list) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: ((context) => ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return NewsArticleItem(
              article: list[index],
            );
          },
          separatorBuilder: (context, index) => articleDiveder(),
          itemCount: list.length,
        )),
    fallback: (context) => defaultLoadingIndicator(),
  );
}
