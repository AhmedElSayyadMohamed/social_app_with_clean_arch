import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/data/models/post_model.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import '../../../../core/constants.dart';
import '../../domain/entities/post.dart';

class FeedsRemoteDataSource extends BaseFeedRemoteDataSource {
  @override
  Future<String?> uploadPostImageToFireStorage(String imageFile) async {
    // get instance from fireStorage
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref();
    final imageRef = ref.child('UserPostsImage/Users/$currentUserId/${DateTime.now()}.jpg');
    UploadTask uploadTask = imageRef.putFile(File(imageFile));

    try {
      final image = await uploadTask;
      final imageUrl = await image.ref.getDownloadURL();
      return imageUrl;
    } catch (error) {
      throw ServerErrorException(msg: error.toString());
    }
  }

  @override
  Future<void> createPostWithImage(Post post) async {
    PostModel postModel = PostModel(
      uId: post.uId,
      date: post.date,
      image: post.image,
      containText: post.containText,
      comments: post.comments,
      likes: post.likes,
      tags: post.tags,
    );

    await FirebaseFirestore.instance
        .collection('UsersPosts')
        .doc(currentUserId)
        .collection('MyPosts')
        .add(postModel.toJson())
        .catchError(
      (error) {
        throw ServerErrorException(msg: error.toString());
      },
    );
  }
}