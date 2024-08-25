class SourcesModel{


  final String status;
  final List<SingleSource> sources;

  SourcesModel({required this.sources, required this.status});

  factory SourcesModel.fromJson(Map<String, dynamic> json){
    return SourcesModel(
        sources: (json["sources"] as List).map(
          (element) => SingleSource.fromJson(element),
        ).toList(),
        status: json["status"]);
  }
}


class SingleSource{
  final String id;
  final String name;

  SingleSource({required this.id, required this.name});

  factory SingleSource.fromJson(Map<String, dynamic> json){

   return SingleSource(id: json["id"], name: json["name"]);

  }

}