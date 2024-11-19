
class UserDM{
  static const String collectionName='User';
  static  UserDM ?currentuser;
  String id;
  String FullName;
  String UserName;
  String Email;
  UserDM({required this.Email,required this.FullName
    ,required this.UserName,required this.id
  });
   Map<String,dynamic>toFireStore()=>{
    'id':id,
    'FullName': FullName,
    'UserName': UserName,
    'Email': Email,

  };
    UserDM .fromFirestore(Map<String, dynamic> data) :this(

      id: data['id'],
      FullName: data['FullName'],
      UserName: data['UserName'],
      Email: data['Email'],
    );


}