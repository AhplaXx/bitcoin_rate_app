import 'dart:convert';
import 'dart:io';

import 'package:elementlist/src/repo/api_status.dart';
import 'package:http/http.dart' as http;



import 'package:elementlist/utils/constants.dart';

class BitcoinServices{
  static Future<Object> getBitcoin() async{
    try{
      var url = Uri.parse(BITCOIN_VALUE);
      var response = await http.get(url);

      if(response.statusCode == 200){
        return Success(
          response: jsonDecode(response.body),
          code: 200
        );
      }else{
        return Failure(response: "Failure", code: VALUE_INVALID_RESPONSE);

      }
    } on HttpException{
      return Failure(response: "No Internet", code: NO_INTERNET);
    } on FormatException{
      return Failure(response: "Invalid Format", code: INVALID_FORMAT);
    } catch (e){
      return Failure(response: "Unkown Error", code: UNKOWN_ERROR);
    }
  }
}