import 'package:facebook_design/models/user_model.dart';

class Story {
  final User? user;
  final String? imageUrl;
  final bool? isViewed;

  const Story({
    required this.user,
    required this.imageUrl,
    this.isViewed = false,
  });
}
