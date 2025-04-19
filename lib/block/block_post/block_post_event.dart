import '../../model/block_post/block_post_model.dart';

abstract class PostEvent {}

class LoadPosts extends PostEvent {}

class AddPost extends PostEvent {
  final PostModel post;
  AddPost(this.post);
}

class UpdatePost extends PostEvent {
  final PostModel post;
  UpdatePost(this.post);
}

class DeletePost extends PostEvent {
  final int postId;
  DeletePost(this.postId);
}
