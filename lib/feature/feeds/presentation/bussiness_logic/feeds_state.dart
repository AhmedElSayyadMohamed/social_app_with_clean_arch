part of 'feeds_bloc.dart';


abstract class FeedsStates {}

final class FeedsInitial extends FeedsStates {}
class PostsInitial extends FeedsStates {}

class AddPostLoadingState extends FeedsStates {}
class AddPostSuccessState extends FeedsStates {}
class AddPostErrorState extends FeedsStates {}

class CreatePostWithoutImageLoadingState extends FeedsStates {}
class CreatePostWithoutImageSuccessState extends FeedsStates {}
class CreatePostWithoutImageErrorState extends FeedsStates {}

class PickImageLoadingState extends FeedsStates {}
class PickImageSuccessState extends FeedsStates {}
class PickImageErrorState extends FeedsStates {
final String errorMsg;

PickImageErrorState(this.errorMsg);
}
class PickImagePermissionDeniedState extends FeedsStates {
final String msg;

PickImagePermissionDeniedState(this.msg);
}
class CloseImageState extends FeedsStates {}

class GetMyPostsByUidLoadingState extends FeedsStates {}
class GetMyPostsByUidSuccessState extends FeedsStates {
  final List<Post> posts;
  GetMyPostsByUidSuccessState(this.posts);
}
class GetMyPostsByUidErrorState extends FeedsStates {
  final String msg;
  GetMyPostsByUidErrorState(this.msg);
}

class LikePostState extends FeedsStates {}
class UnLikePostState extends FeedsStates {}
