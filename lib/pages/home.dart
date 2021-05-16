import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../widgets/app_bar_shape_border.dart';
import '../widgets/gradient_background.dart';
import '../widgets/post_card.dart';
import '../models/post.dart';
import '../pages/post_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _firstLoading = true;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  void loadPosts() {
    context
        .read<PostProvider>()
        .fetchPosts()
        .then(
          (value) => setState(() {
            _firstLoading = false;
          }),
        )
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    });
  }

  void onTapPost(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostDetails(post: post)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: AppBarShapeBorder(),
      ),
      body: GradientBackground(
        child: RefreshIndicator(
          onRefresh: () {
            // add some delay for better UX
            return Future.delayed(
              Duration(milliseconds: 500),
              loadPosts,
            );
          },
          child: _firstLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Scrollbar(
                  thickness: 5,
                  child: ListView(
                    padding: EdgeInsets.only(top: 5),
                    children: postProvider.postList
                        .map(
                          (post) => PostCard(
                            post: post,
                            onTap: () => onTapPost(post),
                          ),
                        )
                        .toList(),
                  ),
                ),
        ),
      ),
    );
  }
}
