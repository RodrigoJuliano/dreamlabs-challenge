import 'package:flutter/material.dart';
import '../models/post.dart';

class PostDetails extends StatelessWidget {
  PostDetails({required this.post}) : super(key: ValueKey(post.id));
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scrollbar(
          thickness: 5,
          child: ListView(
            children: [
              AppBar(
                title: Text(
                  'Post',
                  // style: TextStyle(color: Colors.purple),
                ),
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
