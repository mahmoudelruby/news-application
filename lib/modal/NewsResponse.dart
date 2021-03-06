import 'package:news/modal/articles.dart';

class NewsResponse {

  String status;
  int totalResults;
  List<Articles> articles;

	NewsResponse.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		totalResults = map["totalResults"],
		articles = List<Articles>.from(map["articles"].map((it) => Articles.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['totalResults'] = totalResults;
		data['articles'] = articles != null ? 
			this.articles.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
