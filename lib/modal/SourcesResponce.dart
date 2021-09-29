import 'package:news/modal/source.dart';

class SourcesResponce {

  String status;
  List<Source> sources;

	SourcesResponce.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		sources = List<Source>.from(map["sources"].map((it) => Source.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['sources'] = sources != null ? 
			this.sources.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
