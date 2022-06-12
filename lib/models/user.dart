import 'package:flutter/foundation.dart';

class User{
   int? id;
   String? name;
   String? image;
   String? email;
   String? token;
   User({
     this.id,
     this.name,
     this.image,
     this.email,
     this.token,

   });

   // ignore: non_constant_identifier_names
   factory User.fromJson(Map<String,dynamic> json){
  return User(
    id:json['user']['id'],
    name:json['user']['name'],
    image:json['user']['image'],
    token:json['user']['token'],
    email:json['user']['email'],
  );
   }
}

