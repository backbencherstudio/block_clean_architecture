import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/block_post/block_post_model.dart';
import 'block_post_event.dart';
import 'block_post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final List<PostModel> _postList = [];

  PostBloc() : super(PostInitial()) {
    on<LoadPosts>((event, emit) {
      emit(PostLoading());
      Future.delayed(const Duration(seconds: 1), () {
        emit(PostLoaded(_postList));
      });
    });

    on<AddPost>((event, emit) {
      _postList.add(event.post);
      emit(PostLoaded(List.from(_postList)));
    });

    on<UpdatePost>((event, emit) {
      int index = _postList.indexWhere((p) => p.id == event.post.id);
      if (index != -1) {
        _postList[index] = event.post;
      }
      emit(PostLoaded(List.from(_postList)));
    });

    on<DeletePost>((event, emit) {
      _postList.removeWhere((p) => p.id == event.postId);
      emit(PostLoaded(List.from(_postList)));
    });
  }
}
