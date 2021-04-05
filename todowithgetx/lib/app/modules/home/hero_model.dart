class HeroModel {
  int id;
  String name;
  String alias;
  String description;
  String image;
  String taskPriority;

  HeroModel({id, name, alias, description, image, taskPriority});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    description = json['description']??'';
    image = json['image'];
    taskPriority = json['task_priority'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alias'] = alias;
    data['description'] = description;
    data['image'] = image;
    data['task_priority'] = taskPriority;
    return data;
  }
}
