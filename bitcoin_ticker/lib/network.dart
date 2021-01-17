// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NetworkHelper{

//   //Property to use in the loading screen
//   final String url;

//   NetworkHelper({this.url});

//   //HTTP request
//   Future getData()async{
//      http.Response response = await http.get(url);

//     if(response.statusCode == 200){
//       String data = response.body;

//       return jsonDecode(data);
  
//   }else{
//       print(response.statusCode);
//     }

//   }
// }