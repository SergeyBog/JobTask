class UserProfile {
  int? followers;
  int? postsAmount;
  int? followed;
  String? userName;
  String? location;
  String? profileDescription;
  String? profilePicture;
  List<String>? photos;
  bool? isFollowed;

  UserProfile({
    this.followers,
    this.postsAmount,
    this.followed,
    this.userName,
    this.location,
    this.profileDescription,
    this.photos,
    this.profilePicture,
    this.isFollowed,
  });
}