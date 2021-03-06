class ProjectResponse {
  List<Data> data;
  String message;

  ProjectResponse({this.data, this.message});

  ProjectResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int id;
  String image;
  String nameOfProj;
  String blogLink;
  String details;
  String gitLink;
  String theFile;

  Data(
      {this.id,
      this.image,
      this.nameOfProj,
      this.blogLink,
      this.details,
      this.gitLink,
      this.theFile});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nameOfProj = json['name_of_proj'];
    blogLink = json['blog_link'];
    details = json['details'];
    gitLink = json['git_link'];
    theFile = json['the_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name_of_proj'] = this.nameOfProj;
    data['blog_link'] = this.blogLink;
    data['details'] = this.details;
    data['git_link'] = this.gitLink;
    data['the_file'] = this.theFile;
    return data;
  }
}
