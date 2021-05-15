import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  PostCard({required this.post}) : super(key: ValueKey(post.id));

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Wrap(
            runSpacing: 2,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  post.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  post.body,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
