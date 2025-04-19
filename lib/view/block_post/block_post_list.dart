import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/block_post/block_post_block.dart';
import '../../block/block_post/block_post_event.dart';
import '../../block/block_post/block_post_state.dart';
import '../../model/block_post/block_post_model.dart';

class BlockPostList extends StatelessWidget {
  const BlockPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a post and show'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dummy Post Add
          final post = PostModel(
            id: DateTime.now().millisecondsSinceEpoch,
            title: "New Post",
            body: "Body text",
          );
          context.read<PostBloc>().add(AddPost(post));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          final updatedPost = PostModel(
                            id: post.id,
                            title: "Edited ${post.title}",
                            body: post.body,
                          );
                          context.read<PostBloc>().add(UpdatePost(updatedPost));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<PostBloc>().add(DeletePost(post.id));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: Text("No Posts"));
        },
      ),
    );
  }
}
