import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/gradient_background.dart';

class PostDetails extends StatelessWidget {
  PostDetails({required this.post}) : super(key: ValueKey(post.id));
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Scrollbar(
          thickness: 5,
          child: ListView(
            children: [
              AppBar(
                title: Text('Post'),
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      post.body,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
