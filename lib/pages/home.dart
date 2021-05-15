import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../widgets/app_bar_shape_border.dart';
import '../widgets/post_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().fetchPosts();
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
        // elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30),
        //   ),
        // ),
        toolbarHeight: 50,
        shape: new AppBarShapeBorder(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            // add some delay for better UX
            await Future.delayed(Duration(milliseconds: 500));
            return postProvider.fetchPosts();
          },
          child: Scrollbar(
            thickness: 5,
            child: ListView(
              padding: EdgeInsets.only(top: 5),
              children: postProvider.postList
                  .map((post) => PostCard(post: post))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
