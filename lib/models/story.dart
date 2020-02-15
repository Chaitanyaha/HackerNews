
class Story {

  final String title; 
  final String url; 
  List idComment=List();

  Story({this.title, this.url,this.idComment});

  factory Story.fromJson(Map<String,dynamic> json) {
    return Story(
      title: json["title"], 
      url: json["url"],
      idComment: json['kids']==null?List():json['kids']
    );
  }

}