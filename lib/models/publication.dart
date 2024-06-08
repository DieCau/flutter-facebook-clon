class Publication {
  final String title;
  final DateTime createdAt;
  final String imageUrl;
  final int commentsCount;
  final int sharesCount;
  final User user;
  final Reaction currentUserReaction;

  Publication(
    {
    required this.user,
    required this.currentUserReaction, 
    required this.title,
    required this.createdAt,
    required this.imageUrl,
    required this.commentsCount,
    required this.sharesCount,
  });
}

class User {
  final String avatar;
  final String username;

  User({
    required this.avatar,
    required this.username,
  });
}

enum Reaction {
  like,
  love,
  laughing,
  sad,
  shocking,
  angry,
}
