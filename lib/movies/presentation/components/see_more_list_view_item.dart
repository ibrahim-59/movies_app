import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';

class SeeMoreListViewItem extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String overView;
  final double voteAverage;
  final String date;

  const SeeMoreListViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.overView,
    required this.voteAverage,
    required this.date,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(id: id)));
        },
        child: FittedBox(
          child: SizedBox(
            height: 250,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Row(children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: CachedNetworkImage(
                    height: 250,
                    width: 150,
                    fit: BoxFit.cover,
                    imageUrl: ApiConstance.imageUrl(image),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffff5252),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            date.split('-')[0],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (voteAverage / 2).toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              voteAverage.toString(),
                              style: const TextStyle(
                                fontSize: 1.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 300,
                        child: Text(
                          overView,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
