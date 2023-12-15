class feelingModel{
  String id;
  String feeling;
  String date;

  feelingModel({
    required this.id, 
    required this.feeling, 
    required this.date, 
    });

  feelingModel.fromMap(Map<String, dynamic> map):
    id = map['id'],
    feeling = map['feeling'],
    date = map['date'];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "feeling": feeling,
      "date": date,
    };
  }
}