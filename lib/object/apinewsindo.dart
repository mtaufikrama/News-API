class ApiNewsIndo {
  bool? success;
  String? message;
  Data? data;

  ApiNewsIndo({this.success, this.message, this.data});

  ApiNewsIndo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? link;
  String? image;
  String? description;
  String? title;
  List<Posts>? posts;

  Data({this.link, this.image, this.description, this.title, this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    image = json['image'];
    description = json['description'];
    title = json['title'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['image'] = image;
    data['description'] = description;
    data['title'] = title;
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? link;
  String? title;
  String? pubDate;
  String? description;
  String? thumbnail;

  Posts(
      {this.link, this.title, this.pubDate, this.description, this.thumbnail});

  Posts.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
    pubDate = json['pubDate'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['title'] = title;
    data['pubDate'] = pubDate;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class ApiNewsIndoCategory {
  String? maintainer;
  String? github;
  List<Endpoints>? endpoints;

  ApiNewsIndoCategory({this.maintainer, this.github, this.endpoints});

  ApiNewsIndoCategory.fromJson(Map<String, dynamic> json) {
    maintainer = json['maintainer'];
    github = json['github'];
    if (json['endpoints'] != null) {
      endpoints = <Endpoints>[];
      json['endpoints'].forEach((v) {
        endpoints!.add(Endpoints.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maintainer'] = maintainer;
    data['github'] = github;
    if (endpoints != null) {
      data['endpoints'] = endpoints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Endpoints {
  String? name;
  List<Paths>? paths;

  Endpoints({this.name, this.paths});

  Endpoints.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['paths'] != null) {
      paths = <Paths>[];
      json['paths'].forEach((v) {
        paths!.add(Paths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (paths != null) {
      data['paths'] = paths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paths {
  String? name;
  String? path;

  Paths({this.name, this.path});

  Paths.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['path'] = path;
    return data;
  }
}
