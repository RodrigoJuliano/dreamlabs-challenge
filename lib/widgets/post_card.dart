import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  PostCard({required this.post}) : super(key: ValueKey(post.id));

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Color.fromRGBO(255, 255, 255, 210),
      // color: Colors.purple,
      child: Stack(
        // fit: StackFit.expand,
        children: [
          // Positioned.fill(
          //   child: Container(
          //     color: Color.fromRGBO(255, 255, 255, 200),
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          //       child: Container(
          //         color: Colors.transparent,
          //       ),
          //     ),
          //   ),
          // ),

          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Wrap(
                runSpacing: 5,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      post.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      post.body,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
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
