import 'package:social_app/feature/feeds/data/models/post_model.dart';

import '../../domain/entities/post.dart';

abstract class BaseFeedRemoteDataSource{
  Future<String> uploadPostImageToFireStorage(String imageFile);
  Future<void> createPostWithImage(Post post);
  Future<List<PostModel>> getMyPostsById(String uId);
}