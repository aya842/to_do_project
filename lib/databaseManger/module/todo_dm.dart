class TODoDM{
  static const  String collectionName="todo";
  String id ;
  String title;
  String description;
  DateTime datetime;
  bool isDone;

  TODoDM({ required this.id, required this.title,  required this.description,
     required this.datetime, required  this.isDone});
  Map<String, dynamic> toFireStore() => {
    'id': id,
    'title': title,
    'description': description,
    'datetime': datetime,
    'isDone': isDone,
  };

  TODoDM.fromFireStore(Map<String,dynamic>date) :this (
    id:date['id'],
    title:date['title'],
    description:date['description'],
    datetime:date['datetime'].toDate(),
    isDone:date['isDone'],
  );


}