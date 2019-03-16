class SoundCloud {
  String kind;
  int id;
  String createdAt;
  int userId;
  int duration;
  bool commentable;
  String state;
  int originalContentSize;
  String lastModified;
  String sharing;
  String tagList;
  String permalink;
  bool streamable;
  String embeddableBy;
  Null purchaseUrl;
  Null purchaseTitle;
  Null labelId;
  String genre;
  String title;
  String description;
  Null labelName;
  Null release;
  Null trackType;
  Null keySignature;
  Null isrc;
  Null videoUrl;
  Null bpm;
  Null releaseYear;
  Null releaseMonth;
  Null releaseDay;
  String originalFormat;
  String license;
  String uri;
  User user;
  String permalinkUrl;
  String artworkUrl;
  String streamUrl;
  String downloadUrl;
  int playbackCount;
  int downloadCount;
  int favoritingsCount;
  int repostsCount;
  int commentCount;
  bool downloadable;
  String waveformUrl;
  String attachmentsUri;

  SoundCloud(
      {this.kind,
      this.id,
      this.createdAt,
      this.userId,
      this.duration,
      this.commentable,
      this.state,
      this.originalContentSize,
      this.lastModified,
      this.sharing,
      this.tagList,
      this.permalink,
      this.streamable,
      this.embeddableBy,
      this.purchaseUrl,
      this.purchaseTitle,
      this.labelId,
      this.genre,
      this.title,
      this.description,
      this.labelName,
      this.release,
      this.trackType,
      this.keySignature,
      this.isrc,
      this.videoUrl,
      this.bpm,
      this.releaseYear,
      this.releaseMonth,
      this.releaseDay,
      this.originalFormat,
      this.license,
      this.uri,
      this.user,
      this.permalinkUrl,
      this.artworkUrl,
      this.streamUrl,
      this.downloadUrl,
      this.playbackCount,
      this.downloadCount,
      this.favoritingsCount,
      this.repostsCount,
      this.commentCount,
      this.downloadable,
      this.waveformUrl,
      this.attachmentsUri});

  SoundCloud.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    duration = json['duration'];
    commentable = json['commentable'];
    state = json['state'];
    originalContentSize = json['original_content_size'];
    lastModified = json['last_modified'];
    sharing = json['sharing'];
    tagList = json['tag_list'];
    permalink = json['permalink'];
    streamable = json['streamable'];
    embeddableBy = json['embeddable_by'];
    purchaseUrl = json['purchase_url'];
    purchaseTitle = json['purchase_title'];
    labelId = json['label_id'];
    genre = json['genre'];
    title = json['title'];
    description = json['description'];
    labelName = json['label_name'];
    release = json['release'];
    trackType = json['track_type'];
    keySignature = json['key_signature'];
    isrc = json['isrc'];
    videoUrl = json['video_url'];
    bpm = json['bpm'];
    releaseYear = json['release_year'];
    releaseMonth = json['release_month'];
    releaseDay = json['release_day'];
    originalFormat = json['original_format'];
    license = json['license'];
    uri = json['uri'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    permalinkUrl = json['permalink_url'];
    artworkUrl = json['artwork_url'];
    streamUrl = json['stream_url'];
    downloadUrl = json['download_url'];
    playbackCount = json['playback_count'];
    downloadCount = json['download_count'];
    favoritingsCount = json['favoritings_count'];
    repostsCount = json['reposts_count'];
    commentCount = json['comment_count'];
    downloadable = json['downloadable'];
    waveformUrl = json['waveform_url'];
    attachmentsUri = json['attachments_uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['duration'] = this.duration;
    data['commentable'] = this.commentable;
    data['state'] = this.state;
    data['original_content_size'] = this.originalContentSize;
    data['last_modified'] = this.lastModified;
    data['sharing'] = this.sharing;
    data['tag_list'] = this.tagList;
    data['permalink'] = this.permalink;
    data['streamable'] = this.streamable;
    data['embeddable_by'] = this.embeddableBy;
    data['purchase_url'] = this.purchaseUrl;
    data['purchase_title'] = this.purchaseTitle;
    data['label_id'] = this.labelId;
    data['genre'] = this.genre;
    data['title'] = this.title;
    data['description'] = this.description;
    data['label_name'] = this.labelName;
    data['release'] = this.release;
    data['track_type'] = this.trackType;
    data['key_signature'] = this.keySignature;
    data['isrc'] = this.isrc;
    data['video_url'] = this.videoUrl;
    data['bpm'] = this.bpm;
    data['release_year'] = this.releaseYear;
    data['release_month'] = this.releaseMonth;
    data['release_day'] = this.releaseDay;
    data['original_format'] = this.originalFormat;
    data['license'] = this.license;
    data['uri'] = this.uri;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['permalink_url'] = this.permalinkUrl;
    data['artwork_url'] = this.artworkUrl;
    data['stream_url'] = this.streamUrl;
    data['download_url'] = this.downloadUrl;
    data['playback_count'] = this.playbackCount;
    data['download_count'] = this.downloadCount;
    data['favoritings_count'] = this.favoritingsCount;
    data['reposts_count'] = this.repostsCount;
    data['comment_count'] = this.commentCount;
    data['downloadable'] = this.downloadable;
    data['waveform_url'] = this.waveformUrl;
    data['attachments_uri'] = this.attachmentsUri;
    return data;
  }
}

class User {
  int id;
  String kind;
  String permalink;
  String username;
  String lastModified;
  String uri;
  String permalinkUrl;
  String avatarUrl;

  User(
      {this.id,
      this.kind,
      this.permalink,
      this.username,
      this.lastModified,
      this.uri,
      this.permalinkUrl,
      this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kind = json['kind'];
    permalink = json['permalink'];
    username = json['username'];
    lastModified = json['last_modified'];
    uri = json['uri'];
    permalinkUrl = json['permalink_url'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kind'] = this.kind;
    data['permalink'] = this.permalink;
    data['username'] = this.username;
    data['last_modified'] = this.lastModified;
    data['uri'] = this.uri;
    data['permalink_url'] = this.permalinkUrl;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
