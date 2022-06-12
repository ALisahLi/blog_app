
import 'package:blog_app/models/api_responses.dart';
import 'package:blog_app/screenes/home.dart';
import 'package:blog_app/services/user_service.dart';
import 'package:blog_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/screenes/login.dart';
import 'package:blog_app/main.dart';

class Loading extends StatefulWidget {
    @override
  _LodingState createState() => _LodingState();

}
class _LodingState extends State<Loading> {

  void _loaduserInfo() async {
    String token = await getToken();
    if(token == ''){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false);
    }else{
      ApiResponse response = await getUserDetail();
      if(response.error == null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home()), (route) => false);
      }else if (response.error == unauthorized){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height,
      color:Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
