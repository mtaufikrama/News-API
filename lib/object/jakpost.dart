class JakpostCategory {
  int? status;
  List<Category>? category;

  JakpostCategory({this.status, this.category});

  JakpostCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? name;
  String? link;
  List<SubCategory>? subCategory;

  Category({this.name, this.link, this.subCategory});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    if (subCategory != null) {
      data['subCategory'] = subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  String? name;
  String? link;

  SubCategory({this.name, this.link});

  SubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    return data;
  }
}

class JakpostNews {
  int? status;
  String? important;
  FeaturedPost? featuredPost;
  List<Posts>? posts;
  Pagination? pagination;

  JakpostNews(
      {this.status,
      this.important,
      this.featuredPost,
      this.posts,
      this.pagination});

  JakpostNews.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    important = json['important'];
    featuredPost = json['featured_post'] != null
        ? FeaturedPost.fromJson(json['featured_post'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['important'] = important;
    if (featuredPost != null) {
      data['featured_post'] = featuredPost!.toJson();
    }
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    data['pagination'] = pagination;
    return data;
  }
}

class FeaturedPost {
  String? link;
  String? title;
  String? image;
  String? headline;
  String? category;
  String? imageDesc;
  String? pusblisedAt;

  FeaturedPost(
      {this.link,
      this.title,
      this.image,
      this.headline,
      this.category,
      this.imageDesc,
      this.pusblisedAt});

  FeaturedPost.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    image = json['image'];
    headline = json['headline'];
    category = json['category'];
    imageDesc = json['image_desc'];
    pusblisedAt = json['pusblised_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['title'] = title;
    data['image'] = image;
    data['headline'] = headline;
    data['category'] = category;
    data['image_desc'] = imageDesc;
    data['pusblised_at'] = pusblisedAt;
    return data;
  }
}

class Posts {
  String? link;
  String? title;
  String? image;
  String? headline;
  String? category;
  String? pusblisedAt;
  String? premiumBadge;

  Posts(
      {this.link,
      this.title,
      this.image,
      this.headline,
      this.category,
      this.pusblisedAt,
      this.premiumBadge});

  Posts.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    image = json['image'];
    headline = json['headline'];
    category = json['category'];
    pusblisedAt = json['pusblised_at'];
    premiumBadge = json['premium_badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['title'] = title;
    data['image'] = image;
    data['headline'] = headline;
    data['category'] = category;
    data['pusblised_at'] = pusblisedAt;
    data['premium_badge'] = premiumBadge;
    return data;
  }
}

class JakpostDetail {
  int? status;
  String? important;
  DetailPost? detailPost;

  JakpostDetail({this.status, this.important, this.detailPost});

  JakpostDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    important = json['important'];
    detailPost = json['detail_post'] != null
        ? DetailPost.fromJson(json['detail_post'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['important'] = important;
    if (detailPost != null) {
      data['detail_post'] = detailPost!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? totalPage;

  Pagination({this.currentPage, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPage'] = totalPage;
    data['currentPage'] = currentPage;
    return data;
  }
}

class DetailPost {
  String? title;
  String? image;
  String? author;
  String? location;
  String? imageDesc;
  String? postContent;
  String? pusblisedAt;

  DetailPost(
      {this.title,
      this.image,
      this.author,
      this.location,
      this.imageDesc,
      this.postContent,
      this.pusblisedAt});

  DetailPost.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    author = json['author'];
    location = json['location'];
    imageDesc = json['image_desc'];
    postContent = json['post_content'];
    pusblisedAt = json['pusblised_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['author'] = author;
    data['location'] = location;
    data['image_desc'] = imageDesc;
    data['post_content'] = postContent;
    data['pusblised_at'] = pusblisedAt;
    return data;
  }
}
